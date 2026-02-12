#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MediaPropertySet.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Describes the format of a media stream or media container.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.imediaencodingproperties
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class IMediaEncodingProperties extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaEncodingProperties
     * @type {Guid}
     */
    static IID => Guid("{b4002af6-acd4-4e5a-a24b-5d7498a8b8c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Properties", "get_Type", "put_Subtype", "get_Subtype"]

    /**
     * Gets additional format properties.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.imediaencodingproperties.properties
     * @type {MediaPropertySet} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * Gets the format type.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.imediaencodingproperties.type
     * @type {HSTRING} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * Gets or sets the subtype of the format.
     * @remarks
     * The subtype gives a more specific description of the format than the [Type](imediaencodingproperties_type.md) property. Possible values depend on the class that implements the method. For more information, see the following topics:
     * + [AudioEncodingProperties.Subtype](audioencodingproperties_subtype.md)
     * + [ContainerEncodingProperties.Subtype](containerencodingproperties_subtype.md)
     * + [ImageEncodingProperties.Subtype](imageencodingproperties_subtype.md)
     * + [VideoEncodingProperties.Subtype](videoencodingproperties_subtype.md)
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.imediaencodingproperties.subtype
     * @type {HSTRING} 
     */
    Subtype {
        get => this.get_Subtype()
        set => this.put_Subtype(value)
    }

    /**
     * 
     * @returns {MediaPropertySet} 
     */
    get_Properties() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaPropertySet(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Type() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
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
    put_Subtype(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Subtype() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
