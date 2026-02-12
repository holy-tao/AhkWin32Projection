#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\IMediaStreamDescriptor.ahk
#Include .\MediaStreamSourceSwitchStreamsRequestDeferral.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class IMediaStreamSourceSwitchStreamsRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaStreamSourceSwitchStreamsRequest
     * @type {Guid}
     */
    static IID => Guid("{41b8808e-38a9-4ec3-9ba0-b69b85501e90}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OldStreamDescriptor", "get_NewStreamDescriptor", "GetDeferral"]

    /**
     * @type {IMediaStreamDescriptor} 
     */
    OldStreamDescriptor {
        get => this.get_OldStreamDescriptor()
    }

    /**
     * @type {IMediaStreamDescriptor} 
     */
    NewStreamDescriptor {
        get => this.get_NewStreamDescriptor()
    }

    /**
     * 
     * @returns {IMediaStreamDescriptor} 
     */
    get_OldStreamDescriptor() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMediaStreamDescriptor(value)
    }

    /**
     * 
     * @returns {IMediaStreamDescriptor} 
     */
    get_NewStreamDescriptor() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMediaStreamDescriptor(value)
    }

    /**
     * 
     * @returns {MediaStreamSourceSwitchStreamsRequestDeferral} 
     */
    GetDeferral() {
        result := ComCall(8, this, "ptr*", &deferral_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaStreamSourceSwitchStreamsRequestDeferral(deferral_)
    }
}
