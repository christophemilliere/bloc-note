//
//  NoteTableViewCell.swift
//  Bloc-note
//
//  Created by christophe milliere on 22/10/2017.
//  Copyright © 2017 christophe milliere. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    
    

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    let dateFormatter = DateFormatter()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .medium
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(whit note: Note){
        titleLabel.text = note.titre
        contentLabel.text = note.contenu
        dateLabel.text = dateFormatter.string(from: note.modificationDate)
    }

}
