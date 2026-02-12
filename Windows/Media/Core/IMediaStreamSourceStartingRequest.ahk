#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\MediaStreamSourceStartingRequestDeferral.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class IMediaStreamSourceStartingRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaStreamSourceStartingRequest
     * @type {Guid}
     */
    static IID => Guid("{2a9093e4-35c4-4b1b-a791-0d99db56dd1d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_StartPosition", "GetDeferral", "SetActualStartPosition"]

    /**
     * @type {IReference<TimeSpan>} 
     */
    StartPosition {
        get => this.get_StartPosition()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_StartPosition() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetTimeSpan(), value)
    }

    /**
     * 
     * @returns {MediaStreamSourceStartingRequestDeferral} 
     */
    GetDeferral() {
        result := ComCall(7, this, "ptr*", &deferral_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaStreamSourceStartingRequestDeferral(deferral_)
    }

    /**
     * 
     * @param {TimeSpan} position 
     * @returns {HRESULT} 
     */
    SetActualStartPosition(position) {
        result := ComCall(8, this, "ptr", position, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
