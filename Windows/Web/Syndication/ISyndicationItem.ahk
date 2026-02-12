#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\SyndicationPerson.ahk
#Include .\SyndicationCategory.ahk
#Include .\SyndicationContent.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include .\SyndicationLink.ahk
#Include .\ISyndicationText.ahk
#Include .\SyndicationFeed.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Syndication
 * @version WindowsRuntime 1.4
 */
class ISyndicationItem extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyndicationItem
     * @type {Guid}
     */
    static IID => Guid("{548db883-c384-45c1-8ae8-a378c4ec486c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Authors", "get_Categories", "get_Contributors", "get_Content", "put_Content", "get_Id", "put_Id", "get_LastUpdatedTime", "put_LastUpdatedTime", "get_Links", "get_PublishedDate", "put_PublishedDate", "get_Rights", "put_Rights", "get_Source", "put_Source", "get_Summary", "put_Summary", "get_Title", "put_Title", "get_CommentsUri", "put_CommentsUri", "get_EditUri", "get_EditMediaUri", "get_ETag", "get_ItemUri", "Load", "LoadFromXml"]

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
     * @type {SyndicationContent} 
     */
    Content {
        get => this.get_Content()
        set => this.put_Content(value)
    }

    /**
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
        set => this.put_Id(value)
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
     * @type {DateTime} 
     */
    PublishedDate {
        get => this.get_PublishedDate()
        set => this.put_PublishedDate(value)
    }

    /**
     * @type {ISyndicationText} 
     */
    Rights {
        get => this.get_Rights()
        set => this.put_Rights(value)
    }

    /**
     * @type {SyndicationFeed} 
     */
    Source {
        get => this.get_Source()
        set => this.put_Source(value)
    }

    /**
     * @type {ISyndicationText} 
     */
    Summary {
        get => this.get_Summary()
        set => this.put_Summary(value)
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
    CommentsUri {
        get => this.get_CommentsUri()
        set => this.put_CommentsUri(value)
    }

    /**
     * @type {Uri} 
     */
    EditUri {
        get => this.get_EditUri()
    }

    /**
     * @type {Uri} 
     */
    EditMediaUri {
        get => this.get_EditMediaUri()
    }

    /**
     * @type {HSTRING} 
     */
    ETag {
        get => this.get_ETag()
    }

    /**
     * @type {Uri} 
     */
    ItemUri {
        get => this.get_ItemUri()
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
     * @returns {SyndicationContent} 
     */
    get_Content() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SyndicationContent(value)
    }

    /**
     * 
     * @param {SyndicationContent} value 
     * @returns {HRESULT} 
     */
    put_Content(value) {
        result := ComCall(10, this, "ptr", value, "int")
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
        result := ComCall(11, this, "ptr", value, "int")
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

        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_LastUpdatedTime() {
        value := DateTime()
        result := ComCall(13, this, "ptr", value, "int")
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
        result := ComCall(14, this, "ptr", value, "int")
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
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(SyndicationLink, value)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_PublishedDate() {
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
    put_PublishedDate(value) {
        result := ComCall(17, this, "ptr", value, "int")
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
        result := ComCall(18, this, "ptr*", &value := 0, "int")
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
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {SyndicationFeed} 
     */
    get_Source() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SyndicationFeed(value)
    }

    /**
     * 
     * @param {SyndicationFeed} value 
     * @returns {HRESULT} 
     */
    put_Source(value) {
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ISyndicationText} 
     */
    get_Summary() {
        result := ComCall(22, this, "ptr*", &value := 0, "int")
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
    put_Summary(value) {
        result := ComCall(23, this, "ptr", value, "int")
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
        result := ComCall(24, this, "ptr*", &value := 0, "int")
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
        result := ComCall(25, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_CommentsUri() {
        result := ComCall(26, this, "ptr*", &value := 0, "int")
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
    put_CommentsUri(value) {
        result := ComCall(27, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_EditUri() {
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
    get_EditMediaUri() {
        result := ComCall(29, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ETag() {
        value := HSTRING()
        result := ComCall(30, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ItemUri() {
        result := ComCall(31, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * Reads texel data without any filtering or sampling.
     * @param {HSTRING} item 
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
    Load(item) {
        if(item is String) {
            pin := HSTRING.Create(item)
            item := pin.Value
        }
        item := item is Win32Handle ? NumGet(item, "ptr") : item

        result := ComCall(32, this, "ptr", item, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {XmlDocument} itemDocument 
     * @returns {HRESULT} 
     */
    LoadFromXml(itemDocument) {
        result := ComCall(33, this, "ptr", itemDocument, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
