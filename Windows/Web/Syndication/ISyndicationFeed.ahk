#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\SyndicationPerson.ahk
#Include .\SyndicationCategory.ahk
#Include .\SyndicationGenerator.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SyndicationItem.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include .\SyndicationLink.ahk
#Include .\ISyndicationText.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Syndication
 * @version WindowsRuntime 1.4
 */
class ISyndicationFeed extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyndicationFeed
     * @type {Guid}
     */
    static IID => Guid("{7ffe3cd2-5b66-4d62-8403-1bc10d910d6b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Authors", "get_Categories", "get_Contributors", "get_Generator", "put_Generator", "get_IconUri", "put_IconUri", "get_Id", "put_Id", "get_Items", "get_LastUpdatedTime", "put_LastUpdatedTime", "get_Links", "get_ImageUri", "put_ImageUri", "get_Rights", "put_Rights", "get_Subtitle", "put_Subtitle", "get_Title", "put_Title", "get_FirstUri", "get_LastUri", "get_NextUri", "get_PreviousUri", "get_SourceFormat", "Load", "LoadFromXml"]

    /**
     * @type {IVector<SyndicationPerson>} 
     */
    Authors {
        get => this.get_Authors()
    }

    /**
     * @type {IVector<SyndicationCategory>} 
     */
    Categories {
        get => this.get_Categories()
    }

    /**
     * @type {IVector<SyndicationPerson>} 
     */
    Contributors {
        get => this.get_Contributors()
    }

    /**
     * @type {SyndicationGenerator} 
     */
    Generator {
        get => this.get_Generator()
        set => this.put_Generator(value)
    }

    /**
     * @type {Uri} 
     */
    IconUri {
        get => this.get_IconUri()
        set => this.put_IconUri(value)
    }

    /**
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
        set => this.put_Id(value)
    }

    /**
     * @type {IVector<SyndicationItem>} 
     */
    Items {
        get => this.get_Items()
    }

    /**
     * @type {DateTime} 
     */
    LastUpdatedTime {
        get => this.get_LastUpdatedTime()
        set => this.put_LastUpdatedTime(value)
    }

    /**
     * @type {IVector<SyndicationLink>} 
     */
    Links {
        get => this.get_Links()
    }

    /**
     * @type {Uri} 
     */
    ImageUri {
        get => this.get_ImageUri()
        set => this.put_ImageUri(value)
    }

    /**
     * @type {ISyndicationText} 
     */
    Rights {
        get => this.get_Rights()
        set => this.put_Rights(value)
    }

    /**
     * @type {ISyndicationText} 
     */
    Subtitle {
        get => this.get_Subtitle()
        set => this.put_Subtitle(value)
    }

    /**
     * @type {ISyndicationText} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * @type {Uri} 
     */
    FirstUri {
        get => this.get_FirstUri()
    }

    /**
     * @type {Uri} 
     */
    LastUri {
        get => this.get_LastUri()
    }

    /**
     * @type {Uri} 
     */
    NextUri {
        get => this.get_NextUri()
    }

    /**
     * @type {Uri} 
     */
    PreviousUri {
        get => this.get_PreviousUri()
    }

    /**
     * @type {Integer} 
     */
    SourceFormat {
        get => this.get_SourceFormat()
    }

    /**
     * 
     * @returns {IVector<SyndicationPerson>} 
     */
    get_Authors() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(SyndicationPerson, value)
    }

    /**
     * 
     * @returns {IVector<SyndicationCategory>} 
     */
    get_Categories() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(SyndicationCategory, value)
    }

    /**
     * 
     * @returns {IVector<SyndicationPerson>} 
     */
    get_Contributors() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(SyndicationPerson, value)
    }

    /**
     * 
     * @returns {SyndicationGenerator} 
     */
    get_Generator() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SyndicationGenerator(value)
    }

    /**
     * 
     * @param {SyndicationGenerator} value 
     * @returns {HRESULT} 
     */
    put_Generator(value) {
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_IconUri() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_IconUri(value) {
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        value := HSTRING()
        result := ComCall(13, this, "ptr", value, "int")
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
    put_Id(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<SyndicationItem>} 
     */
    get_Items() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(SyndicationItem, value)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_LastUpdatedTime() {
        value := DateTime()
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_LastUpdatedTime(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<SyndicationLink>} 
     */
    get_Links() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(SyndicationLink, value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ImageUri() {
        result := ComCall(19, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_ImageUri(value) {
        result := ComCall(20, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ISyndicationText} 
     */
    get_Rights() {
        result := ComCall(21, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISyndicationText(value)
    }

    /**
     * 
     * @param {ISyndicationText} value 
     * @returns {HRESULT} 
     */
    put_Rights(value) {
        result := ComCall(22, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ISyndicationText} 
     */
    get_Subtitle() {
        result := ComCall(23, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISyndicationText(value)
    }

    /**
     * 
     * @param {ISyndicationText} value 
     * @returns {HRESULT} 
     */
    put_Subtitle(value) {
        result := ComCall(24, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ISyndicationText} 
     */
    get_Title() {
        result := ComCall(25, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISyndicationText(value)
    }

    /**
     * 
     * @param {ISyndicationText} value 
     * @returns {HRESULT} 
     */
    put_Title(value) {
        result := ComCall(26, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_FirstUri() {
        result := ComCall(27, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_LastUri() {
        result := ComCall(28, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_NextUri() {
        result := ComCall(29, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_PreviousUri() {
        result := ComCall(30, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SourceFormat() {
        result := ComCall(31, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Reads texel data without any filtering or sampling.
     * @param {HSTRING} feed 
     * @returns {HRESULT} <span id="Object"></span><span id="object"></span><span id="OBJECT"></span>*Object*
     * 
     * A [texture-object](dx-graphics-hlsl-to-type.md) type (except TextureCube or TextureCubeArray).
     * 
     * 
     * <span id="Location"></span><span id="location"></span><span id="LOCATION"></span>*Location*
     * 
     * \[in\] The texture coordinates; the last component specifies the mipmap level. This method uses a 0-based coordinate system and not a 0.0-1.0 UV system. The argument type is dependent on the texture-object type.
     * 
     * 
     * 
     * | Object Type                                  | Parameter Type |
     * |----------------------------------------------|----------------|
     * | Buffer                                       | int            |
     * | Texture1D, Texture2DMS                       | int2           |
     * | Texture1DArray, Texture2D, Texture2DMSArray  | int3           |
     * | Texture2DArray, Texture3D                    | int4           |
     * 
     * 
     * 
     *  
     * 
     * For example, to access a 2D texture, supply integer texel coordinates for the first two components and a mipmap level for the third component.
     * 
     * > [!Note]  
     * > When one or more of the coordinates in *Location* exceed the u, v, or w mipmap level dimensions of the texture, **Load** returns zero in all components. Direct3D guarantees to return zero for any resource that is accessed out of bounds.
     * 
     *  
     * 
     * 
     * <span id="SampleIndex"></span><span id="sampleindex"></span><span id="SAMPLEINDEX"></span>*SampleIndex*
     * 
     * \[in\] A sampling index. Required for multi-sample textures. Not supported for other textures.
     * 
     * 
     * 
     * | Texture Type                                                                                                   | Parameter Type |
     * |----------------------------------------------------------------------------------------------------------------|----------------|
     * | Texture1D, Texture1DArray, Texture2D, Texture2DArray, Texture3D, Texture2DArray, TextureCube, TextureCubeArray | not supported  |
     * | Texture2DMS, Texture2DMSArray¹                                                                                 | int            |
     * 
     * 
     * <span id="Offset"></span><span id="offset"></span><span id="OFFSET"></span>*Offset*
     * 
     * \[in\] An optional offset applied to the texture coordinates before sampling. The offset type is dependent on the texture-object type, and needs to be static.
     * 
     * 
     * 
     * | Texture Type                                             | Parameter Type |
     * |----------------------------------------------------------|----------------|
     * | Texture1D, Texture1DArray                                | int            |
     * | Texture2D, Texture2DArray, Texture2DMS, Texture2DMSArray | int2           |
     * | Texture3D                                                | int3           |
     * 
     * 
     * 
     *  
     * 
     * > [!Note]  
     * > *SampleIndex* must always be specified first with multi-sample textures.
     * 
     *  
     * 
     * 
     * 
     * The return type matches the type in the *Object* declaration. For example, a Texture2D object that was declared as "Texture2d&lt;uint4&gt; myTexture;" has a return value of type **uint4**.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/direct3dhlsl/dx-graphics-hlsl-to-load
     */
    Load(feed) {
        if(feed is String) {
            pin := HSTRING.Create(feed)
            feed := pin.Value
        }
        feed := feed is Win32Handle ? NumGet(feed, "ptr") : feed

        result := ComCall(32, this, "ptr", feed, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {XmlDocument} feedDocument 
     * @returns {HRESULT} 
     */
    LoadFromXml(feedDocument) {
        result := ComCall(33, this, "ptr", feedDocument, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
