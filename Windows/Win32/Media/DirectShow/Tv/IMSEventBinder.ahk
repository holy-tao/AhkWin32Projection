#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSEventBinder extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSEventBinder
     * @type {Guid}
     */
    static IID => Guid("{c3a9f406-2222-436d-86d5-ba3229279efb}")

    /**
     * The class identifier for MSEventBinder
     * @type {Guid}
     */
    static CLSID => Guid("{577faa18-4518-445e-8f70-1473f8cf4ba4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Bind", "Unbind"]

    /**
     * A set of string keys that are used with the IBindCtx::RegisterObjectParam method to specify a bind context.
     * @remarks
     * Bind contexts are used to pass optional parameters to functions that have an IBindCtx\* parameter. Those parameters are expressed as COM objects and might implement interfaces that are used to model the parameter data. Some bind contexts represent a Boolean value, where **TRUE** indicates an object that implements only [**IUnknown**](/windows/win32/api/unknwn/nn-unknwn-iunknown) and FALSE indicates no object is present.
     * 
     * [**IShellFolder::ParseDisplayName**](/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-parsedisplayname), [**IShellFolder::BindToObject**](/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-bindtoobject) and [**IShellItem::BindToHandler**](/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellitem-bindtohandler) take a bind context and you can pass them parameters through that bind context.
     * 
     * Some bind contexts are specific to a certain data source implementations or handler types.
     * 
     * Bind context parameters are defined for use with a specific function or method.
     * 
     * When requesting a property store through [**IShellFolder**](/windows/win32/api/shobjidl_core/nn-shobjidl_core-ishellfolder), you can specify the equivalent of [**GPS\_DEFAULT**](/windows/win32/api/propsys/ne-propsys-getpropertystoreflags) by passing in a null [**IBindCtx**](/windows/win32/api/objidl/nn-objidl-ibindctx) parameter. You can also specify the equivalent of GPS\_READWRITE by passing a mode of STGM\_READWRITE \| STGM\_EXCLUSIVE in the bind context.
     * 
     * The property bag specified by the **STR\_PROPERTYBAG\_PARAM** bind context object contains additional values that you can access with the [**IPropertyBag::Read**](/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa768197(v=vs.85)) and [**IPropertyBag::Write**](/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa768198(v=vs.85)) methods.
     * 
     * 
     * 
     * | Property name                                 | Type     | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
     * |-----------------------------------------------|----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | STR\_ENUM\_ITEMS\_FLAGS                       | VT\_UI4  | **Introduced in Windows 8**. Specifies a [**SHCONTF**](/windows/win32/api/shobjidl_core/ne-shobjidl_core-_shcontf) value to be passed to [**IShellFolder::EnumObjects**](/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-enumobjects) when you call [**IShellItem::BindToHandler**](/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellitem-bindtohandler) with **BHID\_EnumItems**.                                                                                                                                                                                                                         |
     * | STR\_PARSE\_EXPLICIT\_ASSOCIATION\_SUCCESSFUL | VT\_BOOL | **Introduced in Windows 7**. The [**IShellFolder::ParseDisplayName**](/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-parsedisplayname) method sets this property to tell the caller that the returned IDList was bound to the [ProgID](fa-progids.md) specified with **STR\_PARSE\_WITH\_EXPLICIT\_PROGID** or the application specified with **STR\_PARSE\_WITH\_EXPLICIT\_ASSOCAPP**. When **STR\_PARSE\_EXPLICIT\_ASSOCIATION\_SUCCESSFUL** is absent, the ProgID or application was not bound into the IDList. |
     * | STR\_PARSE\_WITH\_EXPLICIT\_ASSOCAPP          | VT\_BSTR | **Introduced in Windows 7**. Specify this property to cause a call to the [**IShellFolder::ParseDisplayName**](/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-parsedisplayname) method to return an IDList bound to the file type association handler for the application.                                                                                                                                                                                                                                          |
     * | STR\_PARSE\_WITH\_EXPLICIT\_PROGID            | VT\_BSTR | **Introduced in Windows 7**. Specify this property to cause a call to the [**IShellFolder::ParseDisplayName**](/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-parsedisplayname) method to return an IDList bound to the file association handler of the provided [ProgID](fa-progids.md).                                                                                                                                                                                                                          |
     * 
     * 
     * 
     *  
     * 
     * See the [Parsing With Parameters Sample](samples-parsingwithparameters.md) for an example of the use of bind context values.
     * @param {IDispatch} pEventObject 
     * @param {BSTR} EventName 
     * @param {BSTR} EventHandler 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/shell/str-constants
     */
    Bind(pEventObject, EventName, EventHandler) {
        EventName := EventName is String ? BSTR.Alloc(EventName).Value : EventName
        EventHandler := EventHandler is String ? BSTR.Alloc(EventHandler).Value : EventHandler

        result := ComCall(7, this, "ptr", pEventObject, "ptr", EventName, "ptr", EventHandler, "int*", &CancelID := 0, "HRESULT")
        return CancelID
    }

    /**
     * Closes a handle to a print ticket provider.
     * @param {Integer} CancelCookie 
     * @returns {HRESULT} If the method succeeds, it returns **S\_OK**; otherwise, it returns an **HRESULT** error code. For more information about COM error codes, see [Error Handling](../com/error-handling-in-com.md).
     * @see https://learn.microsoft.com/windows/win32/printdocs/unbindptproviderthunk
     */
    Unbind(CancelCookie) {
        result := ComCall(8, this, "uint", CancelCookie, "HRESULT")
        return result
    }
}
