//
//  ExpensesTableViewController.swift
//  ortbalsn-challenge-expenses
//
//  Created by Nathan Ortbals on 1/23/19.
//  Copyright © 2019 Nathan Ortbals. All rights reserved.
//

import UIKit

let formatter : DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMMM d, yyyy HH:mm"
    return formatter
}()

class ExpensesTableViewController: UITableViewController {

    let expenses = [
        Expense(
            title: "Dinner",
            amount: 32.50,
            date: formatter.date(from: "June 1, 2018 18:30")!
        ),
        Expense(
            title: "Office Supplies",
            amount: 59.32,
            date: formatter.date(from: "May 30, 2018 12:17")!
        ),
        Expense(
            title: "Uber",
            amount: 16.32,
            date: formatter.date(from: "May 30, 2018 11:43")!
        ),
        Expense(
            title: "Coffee",
            amount: 3.95,
            date: formatter.date(from: "May 29, 2018 8:45")!
        )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "expenseCell", for: indexPath)
            as! ExpenseTableViewCell
        
        let expense = expenses[indexPath.row]
        cell.titleLabel?.text = expense.title
        cell.amountLabel?.text = String(format: "$%.02f", expense.amount)
        cell.dateLabel?.text = formatter.string(from: expense.date)
        
        return cell
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }

}
