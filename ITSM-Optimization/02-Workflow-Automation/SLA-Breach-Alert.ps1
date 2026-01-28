<#
.SYNOPSIS
Monitors open incidents and triggers alerts if SLA breach is imminent.

.DESCRIPTION
This script checks all P1 and P2 incidents and automatically escalates to the manager if SLA is near breach.
Sanitized for portfolio use.

.AUTHOR
ITS Analyst – Municipal Government
#>

# Sample Data
$OpenTickets = @(
    @{ID="INC1001"; Priority="P1"; HoursToSLA=2},
    @{ID="INC1002"; Priority="P2"; HoursToSLA=1},
    @{ID="INC1003"; Priority="P3"; HoursToSLA=10}
)

foreach ($ticket in $OpenTickets) {
    if (($ticket.Priority -in @("P1","P2")) -and ($ticket.HoursToSLA -le 2)) {
        Write-Host "ALERT: Ticket $($ticket.ID) at risk of SLA breach. Escalate to Manager."
    } else {
        Write-Host "Ticket $($ticket.ID) is within SLA."
    }
}
