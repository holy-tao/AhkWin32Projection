#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IBindResource extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBindResource
     * @type {Guid}
     */
    static IID => Guid("{0c733ab1-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Bind"]

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
     * @param {IUnknown} pUnkOuter 
     * @param {PWSTR} pwszURL 
     * @param {Integer} dwBindURLFlags 
     * @param {Pointer<Guid>} rguid 
     * @param {Pointer<Guid>} riid 
     * @param {IAuthenticate} pAuthenticate 
     * @param {Pointer<DBIMPLICITSESSION>} pImplSession 
     * @param {Pointer<Integer>} pdwBindStatus 
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/str-constants
     */
    Bind(pUnkOuter, pwszURL, dwBindURLFlags, rguid, riid, pAuthenticate, pImplSession, pdwBindStatus, ppUnk) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        pdwBindStatusMarshal := pdwBindStatus is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pUnkOuter, "ptr", pwszURL, "uint", dwBindURLFlags, "ptr", rguid, "ptr", riid, "ptr", pAuthenticate, "ptr", pImplSession, pdwBindStatusMarshal, pdwBindStatus, "ptr*", ppUnk, "HRESULT")
        return result
    }
}
