#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.MachineLearning
 * @version WindowsRuntime 1.4
 */
class ILearningModelBinding extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILearningModelBinding
     * @type {Guid}
     */
    static IID => Guid("{ea312f20-168f-4f8c-94fe-2e7ac31b4aa8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Bind", "BindWithProperties", "Clear"]

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
     * @param {HSTRING} name 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/shell/str-constants
     */
    Bind(name, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(6, this, "ptr", name, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

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
     * @param {HSTRING} name 
     * @param {IInspectable} value 
     * @param {IPropertySet} props 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/shell/str-constants
     */
    BindWithProperties(name, value, props) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(7, this, "ptr", name, "ptr", value, "ptr", props, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Clear Method (ADO)
     * @remarks
     * Use the **Clear** method on the [Errors](./errors-collection-ado.md) collection to remove all existing [Error](./error-object.md) objects from the collection. When an error occurs, ADO automatically clears the **Errors** collection and fills it with **Error** objects based on the new error.  
     *   
     *  Some properties and methods return warnings that appear as **Error** objects in the **Errors** collection but do not halt a program's execution. Before you call the [Resync](./resync-method.md), [UpdateBatch](./updatebatch-method.md), or [CancelBatch](./cancelbatch-method-ado.md) methods on a [Recordset](./recordset-object-ado.md) object; the [Open](./open-method-ado-connection.md) method on a [Connection](./connection-object-ado.md) object; or set the [Filter](./filter-property.md) property on a **Recordset** object, call the **Clear** method on the **Errors** collection. That way, you can read the [Count](./count-property-ado.md) property of the **Errors** collection to test for returned warnings.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/clear-method-ado
     */
    Clear() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
