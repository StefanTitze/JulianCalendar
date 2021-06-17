function ConvertTo-JulianCalendar
{
    <#
    .SYNOPSIS
    Convert a Gregorian date to a Julian date.
    .DESCRIPTION
    This commandlet converts Gregorian dates to Julian dates.
    .PARAMETER GregorianDate
    The Gregorian date as System.DateTime to convert to a Julian date.
    .INPUTS
    Gregorian dates as System.DateTime to convert to Julian dates.
    .OUTPUTS
    System.DateTime. The Julian dates.
    .EXAMPLE
    PS> ConvertTo-JulianCalendar -GregorianDate (New-Object -TypeName 'System.DateTime' -ArgumentList 2021, 5, 7, 12, 0, 0, 0)


    Saturday, April 24, 2021 12:00:00 PM
    .EXAMPLE
    PS> $date = New-Object -TypeName 'System.DateTime' -ArgumentList 2000, 1, 1, 0, 0, 0, 0, 0
    PS> $date | ConvertTo-JulianCalendar


    Sunday, December 19, 1999 12:00:00 AM
    #>

    [CmdletBinding(PositionalBinding)]

    [OutputType([System.DateTime])]

    param
    (
        [Parameter(mandatory, valuefrompipeline)]
        [System.DateTime]
        $GregorianDate
    )

    begin
    {
        $calendar = New-Object -TypeName 'System.Globalization.JulianCalendar'
    }

    process
    {
        New-Object -TypeName 'System.DateTime' -ArgumentList $calendar.GetYear($GregorianDate), $calendar.GetMonth($GregorianDate), $calendar.GetDayOfMonth($GregorianDate), $GregorianDate.Hour, $GregorianDate.Minute, $GregorianDate.Second, $GregorianDate.Millisecond
    }
}

function ConvertTo-GregorianCalendar
{
    <#
    .SYNOPSIS
    Convert a Julian date to a Gregorian date.
    .DESCRIPTION
    This commandlet converts Julian dates to Gregorian dates.
    .PARAMETER GregorianDate
    The Julian date as System.DateTime to convert to a Gregorian date.
    .INPUTS
    Julian dates as System.DateTime to convert to Gregorian dates.
    .OUTPUTS
    System.DateTime. The gregorian dates.
    .EXAMPLE
    PS> ConvertTo-GregorianCalendar -JulianDate (New-Object -TypeName 'System.DateTime' -ArgumentList 2021, 4, 24, 12, 0, 0, 0)


    Friday, May 7, 2021 12:00:00 PM
    .EXAMPLE
    PS> $date = New-Object -TypeName 'System.DateTime' -ArgumentList 2000, 1, 1, 0, 0, 0, 0, 0
    PS> $date | ConvertTo-GregorianCalendar


    Friday, January 14, 2000 12:00:00 AM
    #>

    [CmdletBinding(PositionalBinding)]

    [OutputType([System.DateTime])]

    param
    (
        [Parameter(mandatory, valuefrompipeline)]
        [System.DateTime]
        $JulianDate
    )

    begin
    {
        $calendar = New-Object -TypeName 'System.Globalization.JulianCalendar'
    }

    process
    {
        $calendar.ToDateTime($JulianDate.Year, $JulianDate.Month, $JulianDate.Day, $JulianDate.Hour, $JulianDate.Minute, $JulianDate.Second, $JulianDate.Millisecond)
    }
}