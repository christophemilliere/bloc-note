//
//  ViewController.swift
//  Bloc-note
//
//  Created by christophe milliere on 15/10/2017.
//  Copyright © 2017 christophe milliere. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentNote: Note?
    @IBOutlet weak var titleTextfield: UITextField!
    
    @IBOutlet weak var fulltext: UITextView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        guard let note = currentNote else { return }
        titleTextfield.text = note.titre
        fulltext.text = note.contenu
        title = note.titre
        navigationItem.largeTitleDisplayMode = .always
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

