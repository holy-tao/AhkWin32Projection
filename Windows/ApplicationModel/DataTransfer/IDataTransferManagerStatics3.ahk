#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class IDataTransferManagerStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataTransferManagerStatics3
     * @type {Guid}
     */
    static IID => Guid("{05845473-6c82-4f5c-ac23-62e458361fac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShowShareUIWithOptions"]

    /**
     * 
     * @param {ShareUIOptions} options 
     * @returns {HRESULT} 
     */
    ShowShareUIWithOptions(options) {
        result := ComCall(6, this, "ptr", options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
