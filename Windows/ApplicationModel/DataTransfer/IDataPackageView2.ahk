#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class IDataPackageView2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataPackageView2
     * @type {Guid}
     */
    static IID => Guid("{40ecba95-2450-4c1d-b6b4-ed45463dee9c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetApplicationLinkAsync", "GetWebLinkAsync"]

    /**
     * 
     * @returns {IAsyncOperation<Uri>} 
     */
    GetApplicationLinkAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(Uri, operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<Uri>} 
     */
    GetWebLinkAsync() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(Uri, operation)
    }
}
