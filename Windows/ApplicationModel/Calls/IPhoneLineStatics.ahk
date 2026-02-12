#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\PhoneLine.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class IPhoneLineStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhoneLineStatics
     * @type {Guid}
     */
    static IID => Guid("{f38b5f23-ceb0-404f-bcf2-ba9f697d8adf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FromIdAsync"]

    /**
     * 
     * @param {Guid} lineId 
     * @returns {IAsyncOperation<PhoneLine>} 
     */
    FromIdAsync(lineId) {
        result := ComCall(6, this, "ptr", lineId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PhoneLine, result_)
    }
}
