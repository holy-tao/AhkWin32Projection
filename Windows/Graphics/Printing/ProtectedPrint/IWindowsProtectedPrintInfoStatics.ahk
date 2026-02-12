#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.ProtectedPrint
 * @version WindowsRuntime 1.4
 */
class IWindowsProtectedPrintInfoStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsProtectedPrintInfoStatics
     * @type {Guid}
     */
    static IID => Guid("{a7d212f3-4168-5485-98ab-d89d04603b40}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsProtectedPrintEnabled"]

    /**
     * @type {Boolean} 
     */
    IsProtectedPrintEnabled {
        get => this.get_IsProtectedPrintEnabled()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsProtectedPrintEnabled() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
