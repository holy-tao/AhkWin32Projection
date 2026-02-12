#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PrintManager.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class IPrintManagerStatic extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintManagerStatic
     * @type {Guid}
     */
    static IID => Guid("{58185dcd-e634-4654-84f0-e0152a8217ac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForCurrentView", "ShowPrintUIAsync"]

    /**
     * 
     * @returns {PrintManager} 
     */
    GetForCurrentView() {
        result := ComCall(6, this, "ptr*", &printingManager := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintManager(printingManager)
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    ShowPrintUIAsync() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }
}
