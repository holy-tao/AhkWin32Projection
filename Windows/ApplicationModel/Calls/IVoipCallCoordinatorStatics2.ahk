#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class IVoipCallCoordinatorStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVoipCallCoordinatorStatics2
     * @type {Guid}
     */
    static IID => Guid("{b8d0288b-01ea-5478-8404-a1fb06f2b83b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsCallControlDeviceKindSupportedForAssociation", "GetDeviceSelectorForCallControl"]

    /**
     * 
     * @param {Integer} kind 
     * @returns {Boolean} 
     */
    IsCallControlDeviceKindSupportedForAssociation(kind) {
        result := ComCall(6, this, "int", kind, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetDeviceSelectorForCallControl() {
        result_ := HSTRING()
        result := ComCall(7, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
