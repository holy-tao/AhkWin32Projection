#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Media\MediaProperties\MediaEncodingProfile.ahk
#Include ..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class IChatMessageTransportConfiguration extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IChatMessageTransportConfiguration
     * @type {Guid}
     */
    static IID => Guid("{879ff725-1a08-4aca-a075-3355126312e6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MaxAttachmentCount", "get_MaxMessageSizeInKilobytes", "get_MaxRecipientCount", "get_SupportedVideoFormat", "get_ExtendedProperties"]

    /**
     * @type {Integer} 
     */
    MaxAttachmentCount {
        get => this.get_MaxAttachmentCount()
    }

    /**
     * @type {Integer} 
     */
    MaxMessageSizeInKilobytes {
        get => this.get_MaxMessageSizeInKilobytes()
    }

    /**
     * @type {Integer} 
     */
    MaxRecipientCount {
        get => this.get_MaxRecipientCount()
    }

    /**
     * @type {MediaEncodingProfile} 
     */
    SupportedVideoFormat {
        get => this.get_SupportedVideoFormat()
    }

    /**
     * @type {IMapView<HSTRING, IInspectable>} 
     */
    ExtendedProperties {
        get => this.get_ExtendedProperties()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxAttachmentCount() {
        result := ComCall(6, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxMessageSizeInKilobytes() {
        result := ComCall(7, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxRecipientCount() {
        result := ComCall(8, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {MediaEncodingProfile} 
     */
    get_SupportedVideoFormat() {
        result := ComCall(9, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaEncodingProfile(result_)
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IInspectable>} 
     */
    get_ExtendedProperties() {
        result := ComCall(10, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMapView((ptr) => HSTRING({ Value: ptr }), IInspectable, result_)
    }
}
