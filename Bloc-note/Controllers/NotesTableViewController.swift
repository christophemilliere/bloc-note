//
//  NotesTableViewController.swift
//  Bloc-note
//
//  Created by christophe milliere on 18/10/2017.
//  Copyright © 2017 christophe milliere. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController {
    var book: NoteBook?
    @IBAction func saveAction(_ sender: Any) {
        save()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let notebook = read() {
            book = notebook
        } else {
            book = NoteBook()
            for i in 1...10 {
                let note = Note()
                note.titre = "Ma premier note \(i)"
                note.contenu = "Ma premier note description \(i)"
                book?.add(note: note)
            }
        }
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @IBAction func addTitle(_ sender: Any) {
        let note = Note()
        note.titre = "Nouveau contenu"
        
        book?.add(note: note)
        tableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return book!.listNotes().count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as? NoteTableViewCell else {
            fatalError("UNe mauvaise cellule")
        }
        cell.configure(whit: book!.listNotes()[indexPath.row])

        return cell
    }
    
    
    func save(){
        guard let json = try? JSONEncoder().encode(book) else { return }
        guard let documentFolderUrl = documentFolderUrl() else { return }
        let jsonUrl = documentFolderUrl.appendingPathComponent("notebook.json")
        try? json.write(to: jsonUrl)
        
    }
    
    func read() -> NoteBook? {
        guard let documentFolderUrl = documentFolderUrl() else { return nil }
        let jsonUrl = documentFolderUrl.appendingPathComponent("notebook.json")
        guard let dataRead = try? Data(contentsOf: jsonUrl) else { return nil }
        
        return try? JSONDecoder().decode(NoteBook.self, from: dataRead)
    }
    
    func documentFolderUrl() -> URL? {
        let manager = FileManager.default
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        
        return url
    }
    


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "note" {
            guard let destination = segue.destination as? ViewController else { return }
            guard let cell = sender as? UITableViewCell else { return }
            guard let indexPath = tableView.indexPath(for: cell) else { return }
            destination.currentNote = book!.listNotes()[indexPath.row]
//            if  {
//                let notes = segue.destination as! ViewController
//            }
        }
    }
 

}
