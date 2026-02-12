#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\MediaTransportControls.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Media\Casting\CastingSource.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IMediaElement3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaElement3
     * @type {Guid}
     */
    static IID => Guid("{479f6f13-0fdb-4ed8-928a-4d39169c3cd2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TransportControls", "put_TransportControls", "add_PartialMediaFailureDetected", "remove_PartialMediaFailureDetected", "SetPlaybackSource", "GetAsCastingSource"]

    /**
     * @type {MediaTransportControls} 
     */
    TransportControls {
        get => this.get_TransportControls()
        set => this.put_TransportControls(value)
    }

    /**
     * 
     * @returns {MediaTransportControls} 
     */
    get_TransportControls() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaTransportControls(value)
    }

    /**
     * 
     * @param {MediaTransportControls} value 
     * @returns {HRESULT} 
     */
    put_TransportControls(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MediaElement, PartialMediaFailureDetectedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PartialMediaFailureDetected(handler) {
        token := EventRegistrationToken()
        result := ComCall(8, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PartialMediaFailureDetected(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IMediaPlaybackSource} source 
     * @returns {HRESULT} 
     */
    SetPlaybackSource(source) {
        result := ComCall(10, this, "ptr", source, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {CastingSource} 
     */
    GetAsCastingSource() {
        result := ComCall(11, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CastingSource(result_)
    }
}
