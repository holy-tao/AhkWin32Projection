#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Foundation\Collections\ValueSet.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\Collections\IObservableVector.ahk
#Include .\TimedTextSource.ahk
#Include .\TimedMetadataTrack.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class IMediaSource2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaSource2
     * @type {Guid}
     */
    static IID => Guid("{2eb61048-655f-4c37-b813-b4e45dfa0abe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_OpenOperationCompleted", "remove_OpenOperationCompleted", "get_CustomProperties", "get_Duration", "get_IsOpen", "get_ExternalTimedTextSources", "get_ExternalTimedMetadataTracks"]

    /**
     * @type {ValueSet} 
     */
    CustomProperties {
        get => this.get_CustomProperties()
    }

    /**
     * @type {IReference<TimeSpan>} 
     */
    Duration {
        get => this.get_Duration()
    }

    /**
     * @type {Boolean} 
     */
    IsOpen {
        get => this.get_IsOpen()
    }

    /**
     * @type {IObservableVector<TimedTextSource>} 
     */
    ExternalTimedTextSources {
        get => this.get_ExternalTimedTextSources()
    }

    /**
     * @type {IObservableVector<TimedMetadataTrack>} 
     */
    ExternalTimedMetadataTracks {
        get => this.get_ExternalTimedMetadataTracks()
    }

    /**
     * 
     * @param {TypedEventHandler<MediaSource, MediaSourceOpenOperationCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_OpenOperationCompleted(handler) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", token, "int")
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
    remove_OpenOperationCompleted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ValueSet} 
     */
    get_CustomProperties() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ValueSet(value)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_Duration() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetTimeSpan(), value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOpen() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IObservableVector<TimedTextSource>} 
     */
    get_ExternalTimedTextSources() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IObservableVector(TimedTextSource, value)
    }

    /**
     * 
     * @returns {IObservableVector<TimedMetadataTrack>} 
     */
    get_ExternalTimedMetadataTracks() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IObservableVector(TimedMetadataTrack, value)
    }
}
