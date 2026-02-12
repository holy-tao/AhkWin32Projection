#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\DataTransferManager.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class IDataTransferManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataTransferManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{a9da01aa-e00e-4cfe-aa44-2dd932dca3d8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShowShareUI", "GetForCurrentView"]

    /**
     * 
     * @returns {HRESULT} 
     */
    ShowShareUI() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DataTransferManager} 
     */
    GetForCurrentView() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataTransferManager(result_)
    }
}
