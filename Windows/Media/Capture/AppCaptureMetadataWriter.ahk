#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppCaptureMetadataWriter.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\AppCaptureMetadataWriter.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Enables an app to store metadata that the system will insert into captured video files or broadcast streams of app content.
 * @remarks
 * When you create an instance of **AppCaptureMetadataWriter**, the system initializes a unique instance for your app and is then ready for you to write metadata items. Although only one app can be capturing or broadcasting at a time, the system can accumulate metadata for multiple apps simultaneously. **AppCaptureMetadataWriter** does not initiate or modify the current capture or broadcast state. You should create and hold onto the instance of **AppCaptureMetadataWriter** as long as you want the system to hold the metadata in memory.
 * When the instance of **AppCaptureMetadataWriter** is released, all metadata associated with that instance of **AppCaptureMetadataWriter** is released as well.
 * 
 * 
 * When you write a metadata item, the system associates a timestamp with the item so that it is automatically included with the captured or broadcast time range to which it applies. 
 * 
 * Currently, two different types of metadata items are supported **AppCaptureMetadataWriter**: events and state. A metadata event is associated with a single point in time and usually is associated with a instantaneous action, such as a player in a game scoring a point. A state is a metadata item that applies across a window of time. An example of this is a state that contains the name of the game map that a player is currently in. Once a state value has been set, the system maintains that value for the state until it is set to a different value, until it is stopped with a call [StopState](/uwp/api/windows.media.capture.appcapturemetadatawriter#Windows_Media_Capture_AppCaptureMetadataWriter_StopState_System_String_), or until all states are ended with a call to [StopAllStates](/uwp/api/windows.media.capture.appcapturemetadatawriter.StopAllStates). Both events and states are represented as a key/value pair where the key is the state or event name and the value is either an integer, a double, or a string value. 
 * 
 * When historical app capture is enabled, the system accumulates metadata written with **AppCaptureMetadataWriter** even when not actively capturing or broadcasting. When, for example, a capture of the previous 30 seconds is written to a video file on disk, the metadata associated with the recorded time window is included in the file. The system imposes a limit on the storage space that is allocated per app for storing accumulated metadata. You can get the currently available storage space by checking the [**RemainingStorageBytesAvailable**](/uwp/api/windows.media.capture.appcapturemetadatawriter.RemainingStorageBytesAvailable) property.
 * 
 * When the all of the allotted space has been filled, the system will begin purging metadata using the [AppCaptureMetadataPriority](/uwp/api/windows.media.capture.appcapturemetadatapriority) value, specified when the metadata items were written, and the age of each item in order to delete the oldest, least important data first. When this occurs, the [MetadataPurged](/uwp/api/windows.media.capture.appcapturemetadatawriter.MetadataPurged) event is raised. In response to this event, you may choose to reduce the amount of metadata your app is writing, but this is not required.
 * 
 * 
 * 
 * Metadata items are classified as **Important** or **Informational** as specified with the [AppCaptureMetadataPriority](appcapturemetadatapriority.md) enumeration. **Important** priority means the metadata will be uploaded to the Xbox Live service.  The metadata will be used to help users search clips or annotate broadcasts, among other things.
 * Both **Important** and **Informational** metadata are embedded in the generated .mp4 file, so you should not include any private user information in the metadata.
 * 
 * This API may throw an error if the background service has shut down due to idle timeout.
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturemetadatawriter
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppCaptureMetadataWriter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppCaptureMetadataWriter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppCaptureMetadataWriter.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the number of bytes remaining in the storage space allocated by the system for app capture metadata items.
     * @remarks
     * Because historical app capture is supported, the system accumulates metadata written with **AppCaptureMetadataWriter** even when not actively capturing or broadcasting. When, for example, a capture of the previous 30 seconds is written to a video file on disk, the metadata associated with the recorded time window is included in the file. The system imposes a limit on the storage space that is allocated per app for storing accumulated metadata. You can get the currently available storage space by checking the [RemainingStorageBytesAvailable](/uwp/api/windows.media.capture.appcapturemetadatawriter.RemainingStorageBytesAvailable) property.
     * 
     * When the all of the allotted space has been filled, the system will begin purging metadata using the [AppCaptureMetadataPriority](/uwp/api/windows.media.capture.appcapturemetadatapriority) value, specified when the metadata items were written, and the age of each item in order to delete the oldest, least important data first. When this occurs, the [MetadataPurged](/uwp/api/windows.media.capture.appcapturemetadatawriter.MetadataPurged) event is raised. In response to this event, you may choose to reduce the amount of metadata your app is writing, but this is not required.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturemetadatawriter.remainingstoragebytesavailable
     * @type {Integer} 
     */
    RemainingStorageBytesAvailable {
        get => this.get_RemainingStorageBytesAvailable()
    }

    /**
     * Occurs when the system purges previously stored metadata items.
     * @remarks
     * Because historical app capture is supported, the system accumulates metadata written with **AppCaptureMetadataWriter** even when not actively capturing or broadcasting. When, for example, a capture of the previous 30 seconds is written to a video file on disk, the metadata associated with the recorded time window is included in the file. The system imposes a limit on the storage space that is allocated per app for storing accumulated metadata. You can get the currently available storage space by checking the [RemainingStorageBytesAvailable](/uwp/api/windows.media.capture.appcapturemetadatawriter.RemainingStorageBytesAvailable) property.
     * 
     * When the all of the allotted space has been filled, the system will begin purging metadata using the [AppCaptureMetadataPriority](/uwp/api/windows.media.capture.appcapturemetadatapriority) value, specified when the metadata items were written, and the age of each item in order to delete the oldest, least important data first. When this occurs, the [MetadataPurged](/uwp/api/windows.media.capture.appcapturemetadatawriter.MetadataPurged) event is raised. In response to this event, you may choose to reduce the amount of metadata your app is writing, but this is not required.
     * @type {TypedEventHandler<AppCaptureMetadataWriter, IInspectable>}
    */
    OnMetadataPurged {
        get {
            if(!this.HasProp("__OnMetadataPurged")){
                this.__OnMetadataPurged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{1aaed84c-ed87-5f38-a9d1-3553128d4a62}"),
                    AppCaptureMetadataWriter,
                    IInspectable
                )
                this.__OnMetadataPurgedToken := this.add_MetadataPurged(this.__OnMetadataPurged.iface)
            }
            return this.__OnMetadataPurged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the **AppCaptureMetadataWriter** class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Capture.AppCaptureMetadataWriter")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnMetadataPurgedToken")) {
            this.remove_MetadataPurged(this.__OnMetadataPurgedToken)
            this.__OnMetadataPurged.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * Adds a new string metadata event.
     * @remarks
     * The system associates a metadata event with a timestamp when this method is called. To store a string value that applies to a window of time, use [StartStringState](/uwp/api/windows.media.capture.appcapturemetadatawriter#Windows_Media_Capture_AppCaptureMetadataWriter_StartStringState_System_String_System_String_Windows_Media_Capture_AppCaptureMetadataPriority_).
     * @param {HSTRING} name The name of the metadata event.
     * @param {HSTRING} value The value of the metadata event.
     * @param {Integer} priority_ A member of the [AppCaptureMetadataPriority](/uwp/api/windows.media.capture.appcapturemetadatapriority) enumeration specifying the relative importance of the metadata item. This value and the age of a metadata item are used by the system to determine which metadata items should be purged first when the limit of the allocated storage space for accumulated metadata is reached.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturemetadatawriter.addstringevent
     */
    AddStringEvent(name, value, priority_) {
        if (!this.HasProp("__IAppCaptureMetadataWriter")) {
            if ((queryResult := this.QueryInterface(IAppCaptureMetadataWriter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureMetadataWriter := IAppCaptureMetadataWriter(outPtr)
        }

        return this.__IAppCaptureMetadataWriter.AddStringEvent(name, value, priority_)
    }

    /**
     * Adds a new integer metadata event.
     * @remarks
     * The system associates a metadata event with a timestamp when this method is called. To store an integer value that applies to a window of time, use [StartInt32State](/uwp/api/windows.media.capture.appcapturemetadatawriter#Windows_Media_Capture_AppCaptureMetadataWriter_StartInt32State_System_String_System_Int32_Windows_Media_Capture_AppCaptureMetadataPriority_).
     * @param {HSTRING} name The name of the metadata event.
     * @param {Integer} value The value of the metadata event.
     * @param {Integer} priority_ A member of the [AppCaptureMetadataPriority](/uwp/api/windows.media.capture.appcapturemetadatapriority) enumeration specifying the relative importance of the metadata item. This value and the age of a metadata item are used by the system to determine which metadata items should be purged first when the limit of the allocated storage space for accumulated metadata is reached.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturemetadatawriter.addint32event
     */
    AddInt32Event(name, value, priority_) {
        if (!this.HasProp("__IAppCaptureMetadataWriter")) {
            if ((queryResult := this.QueryInterface(IAppCaptureMetadataWriter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureMetadataWriter := IAppCaptureMetadataWriter(outPtr)
        }

        return this.__IAppCaptureMetadataWriter.AddInt32Event(name, value, priority_)
    }

    /**
     * Adds a new double metadata event.
     * @remarks
     * The system associates a metadata event with a timestamp when this method is called. To store a double value that applies to a window of time, use [StartDoubleState](/uwp/api/windows.media.capture.appcapturemetadatawriter#Windows_Media_Capture_AppCaptureMetadataWriter_StartDoubleState_System_String_System_Double_Windows_Media_Capture_AppCaptureMetadataPriority_).
     * @param {HSTRING} name The name of the metadata event.
     * @param {Float} value The value of the metadata event.
     * @param {Integer} priority_ A member of the [AppCaptureMetadataPriority](/uwp/api/windows.media.capture.appcapturemetadatapriority) enumeration specifying the relative importance of the metadata item. This value and the age of a metadata item are used by the system to determine which metadata items should be purged first when the limit of the allocated storage space for accumulated metadata is reached.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturemetadatawriter.adddoubleevent
     */
    AddDoubleEvent(name, value, priority_) {
        if (!this.HasProp("__IAppCaptureMetadataWriter")) {
            if ((queryResult := this.QueryInterface(IAppCaptureMetadataWriter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureMetadataWriter := IAppCaptureMetadataWriter(outPtr)
        }

        return this.__IAppCaptureMetadataWriter.AddDoubleEvent(name, value, priority_)
    }

    /**
     * Adds a new double metadata state.
     * @remarks
     * The system associates a metadata state with the window of time between when the state is started and when its value is changed or the state is stopped with a call to [StopAllStates](/uwp/api/windows.media.capture.appcapturemetadatawriter.StopAllStates). To store a string value that applies to an instantaneous moment in time, use [AddStringEvent](/uwp/api/windows.media.capture.appcapturemetadatawriter#Windows_Media_Capture_AppCaptureMetadataWriter_AddStringEvent_System_String_System_String_Windows_Media_Capture_AppCaptureMetadataPriority_).
     * @param {HSTRING} name The name of the metadata state.
     * @param {HSTRING} value The value of the metadata state.
     * @param {Integer} priority_ A member of the [AppCaptureMetadataPriority](/uwp/api/windows.media.capture.appcapturemetadatapriority) enumeration specifying the relative importance of the metadata item. This value and the age of a metadata item are used by the system to determine which metadata items should be purged first when the limit of the allocated storage space for accumulated metadata is reached.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturemetadatawriter.startstringstate
     */
    StartStringState(name, value, priority_) {
        if (!this.HasProp("__IAppCaptureMetadataWriter")) {
            if ((queryResult := this.QueryInterface(IAppCaptureMetadataWriter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureMetadataWriter := IAppCaptureMetadataWriter(outPtr)
        }

        return this.__IAppCaptureMetadataWriter.StartStringState(name, value, priority_)
    }

    /**
     * Adds a new double metadata state.
     * @remarks
     * The system associates a metadata state with the window of time between when the state is started and when its value is changed or the state is stopped with a call to [StopAllStates](/uwp/api/windows.media.capture.appcapturemetadatawriter.StopAllStates). To store a integer value that applies to an instantaneous moment in time, use [AddInt32Event](/uwp/api/windows.media.capture.appcapturemetadatawriter#Windows_Media_Capture_AppCaptureMetadataWriter_AddInt32Event_System_String_System_Int32_Windows_Media_Capture_AppCaptureMetadataPriority_).
     * @param {HSTRING} name The name of the metadata state.
     * @param {Integer} value The value of the metadata state.
     * @param {Integer} priority_ A member of the [AppCaptureMetadataPriority](/uwp/api/windows.media.capture.appcapturemetadatapriority) enumeration specifying the relative importance of the metadata item. This value and the age of a metadata item are used by the system to determine which metadata items should be purged first when the limit of the allocated storage space for accumulated metadata is reached.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturemetadatawriter.startint32state
     */
    StartInt32State(name, value, priority_) {
        if (!this.HasProp("__IAppCaptureMetadataWriter")) {
            if ((queryResult := this.QueryInterface(IAppCaptureMetadataWriter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureMetadataWriter := IAppCaptureMetadataWriter(outPtr)
        }

        return this.__IAppCaptureMetadataWriter.StartInt32State(name, value, priority_)
    }

    /**
     * Adds a new double metadata state.
     * @remarks
     * The system associates a metadata state with the window of time between when the state is started and when its value is changed or the state is stopped with a call to [StopAllStates](/uwp/api/windows.media.capture.appcapturemetadatawriter.StopAllStates). To store a double value that applies to an instantaneous moment in time, use [AddDoubleEvent](/uwp/api/windows.media.capture.appcapturemetadatawriter#Windows_Media_Capture_AppCaptureMetadataWriter_AddDoubleEvent_System_String_System_Double_Windows_Media_Capture_AppCaptureMetadataPriority_).
     * @param {HSTRING} name The name of the metadata state.
     * @param {Float} value The value of the metadata state.
     * @param {Integer} priority_ A member of the [AppCaptureMetadataPriority](/uwp/api/windows.media.capture.appcapturemetadatapriority) enumeration specifying the relative importance of the metadata item. This value and the age of a metadata item are used by the system to determine which metadata items should be purged first when the limit of the allocated storage space for accumulated metadata is reached.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturemetadatawriter.startdoublestate
     */
    StartDoubleState(name, value, priority_) {
        if (!this.HasProp("__IAppCaptureMetadataWriter")) {
            if ((queryResult := this.QueryInterface(IAppCaptureMetadataWriter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureMetadataWriter := IAppCaptureMetadataWriter(outPtr)
        }

        return this.__IAppCaptureMetadataWriter.StartDoubleState(name, value, priority_)
    }

    /**
     * Stops the metadata state with the specified identifier.
     * @remarks
     * Start a metadata state by calling [StartDoubleState](/uwp/api/windows.media.capture.appcapturemetadatawriter#Windows_Media_Capture_AppCaptureMetadataWriter_StartDoubleState_System_String_System_Double_Windows_Media_Capture_AppCaptureMetadataPriority_), [StartInt32State](/uwp/api/windows.media.capture.appcapturemetadatawriter#Windows_Media_Capture_AppCaptureMetadataWriter_StartInt32State_System_String_System_Int32_Windows_Media_Capture_AppCaptureMetadataPriority_), or [StartStringState](/uwp/api/windows.media.capture.appcapturemetadatawriter#Windows_Media_Capture_AppCaptureMetadataWriter_StartStringState_System_String_System_String_Windows_Media_Capture_AppCaptureMetadataPriority_), specifying the state identifier that you can later pass into [StopState](/uwp/api/windows.media.capture.appcapturemetadatawriter#Windows_Media_Capture_AppCaptureMetadataWriter_StopState_System_String_). Stop all states with a single call to [StopAllStates](/uwp/api/windows.media.capture.appcapturemetadatawriter.StopAllStates).
     * @param {HSTRING} name The identifier of the state to be stopped.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturemetadatawriter.stopstate
     */
    StopState(name) {
        if (!this.HasProp("__IAppCaptureMetadataWriter")) {
            if ((queryResult := this.QueryInterface(IAppCaptureMetadataWriter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureMetadataWriter := IAppCaptureMetadataWriter(outPtr)
        }

        return this.__IAppCaptureMetadataWriter.StopState(name)
    }

    /**
     * Stops all metadata states.
     * @remarks
     * Start a metadata state by calling [StartDoubleState](/uwp/api/windows.media.capture.appcapturemetadatawriter#Windows_Media_Capture_AppCaptureMetadataWriter_StartDoubleState_System_String_System_Double_Windows_Media_Capture_AppCaptureMetadataPriority_), [StartInt32State](/uwp/api/windows.media.capture.appcapturemetadatawriter#Windows_Media_Capture_AppCaptureMetadataWriter_StartInt32State_System_String_System_Int32_Windows_Media_Capture_AppCaptureMetadataPriority_), or [StartStringState](/uwp/api/windows.media.capture.appcapturemetadatawriter#Windows_Media_Capture_AppCaptureMetadataWriter_StartStringState_System_String_System_String_Windows_Media_Capture_AppCaptureMetadataPriority_). Stop a single state by calling [StopState](/uwp/api/windows.media.capture.appcapturemetadatawriter#Windows_Media_Capture_AppCaptureMetadataWriter_StopState_System_String_).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturemetadatawriter.stopallstates
     */
    StopAllStates() {
        if (!this.HasProp("__IAppCaptureMetadataWriter")) {
            if ((queryResult := this.QueryInterface(IAppCaptureMetadataWriter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureMetadataWriter := IAppCaptureMetadataWriter(outPtr)
        }

        return this.__IAppCaptureMetadataWriter.StopAllStates()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RemainingStorageBytesAvailable() {
        if (!this.HasProp("__IAppCaptureMetadataWriter")) {
            if ((queryResult := this.QueryInterface(IAppCaptureMetadataWriter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureMetadataWriter := IAppCaptureMetadataWriter(outPtr)
        }

        return this.__IAppCaptureMetadataWriter.get_RemainingStorageBytesAvailable()
    }

    /**
     * 
     * @param {TypedEventHandler<AppCaptureMetadataWriter, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MetadataPurged(handler) {
        if (!this.HasProp("__IAppCaptureMetadataWriter")) {
            if ((queryResult := this.QueryInterface(IAppCaptureMetadataWriter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureMetadataWriter := IAppCaptureMetadataWriter(outPtr)
        }

        return this.__IAppCaptureMetadataWriter.add_MetadataPurged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MetadataPurged(token) {
        if (!this.HasProp("__IAppCaptureMetadataWriter")) {
            if ((queryResult := this.QueryInterface(IAppCaptureMetadataWriter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureMetadataWriter := IAppCaptureMetadataWriter(outPtr)
        }

        return this.__IAppCaptureMetadataWriter.remove_MetadataPurged(token)
    }

    /**
     * Disposes of the object and associated resources.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturemetadatawriter.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
