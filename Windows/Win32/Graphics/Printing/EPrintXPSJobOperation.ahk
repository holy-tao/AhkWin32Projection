#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies whether an XPS print job is in the spooling or the rendering phase.
 * @remarks
 * This enumeration is primarily used as a parameter for the [**ReportJobProcessingProgress**](reportjobprocessingprogress.md) function.
 * @see https://learn.microsoft.com/windows/win32/printdocs/eprintxpsjoboperation
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct EPrintXPSJobOperation {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static kJobProduction => 1

    /**
     * @type {Integer (Int32)}
     */
    static kJobConsumption => 2
}
