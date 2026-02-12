#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Defines the interface implemented by media tracks.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.imediatrack
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class IMediaTrack extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaTrack
     * @type {Guid}
     */
    static IID => Guid("{03e1fafc-c931-491a-b46b-c10ee8c256b7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_Language", "get_TrackKind", "put_Label", "get_Label"]

    /**
     * Gets the identifier of the media track.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.imediatrack.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets a string indicating the language of the media track.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.imediatrack.language
     * @type {HSTRING} 
     */
    Language {
        get => this.get_Language()
    }

    /**
     * Gets a value indicating the type of data the track contains.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.imediatrack.trackkind
     * @type {Integer} 
     */
    TrackKind {
        get => this.get_TrackKind()
    }

    /**
     * Gets or sets the label for the media track.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.imediatrack.label
     * @type {HSTRING} 
     */
    Label {
        get => this.get_Label()
        set => this.put_Label(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Language() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TrackKind() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Label(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Label() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
