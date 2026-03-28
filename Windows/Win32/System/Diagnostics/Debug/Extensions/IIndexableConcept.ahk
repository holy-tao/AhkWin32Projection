#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IIndexableConcept extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIndexableConcept
     * @type {Guid}
     */
    static IID => Guid("{d1fad99f-3f53-4457-850c-8051df2d3fb5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDimensionality", "GetAt", "SetAt"]

    /**
     * 
     * @param {IModelObject} contextObject 
     * @returns {Integer} 
     */
    GetDimensionality(contextObject) {
        result := ComCall(3, this, "ptr", contextObject, "uint*", &dimensionality := 0, "HRESULT")
        return dimensionality
    }

    /**
     * Retrieves a copy of the character string associated with the specified local atom. (ANSI)
     * @remarks
     * The string returned for an integer atom (an atom whose value is in the range 0x0001 to 0xBFFF) is a null-terminated string in which the first character is a pound sign (#) and the remaining characters represent the unsigned integer atom value. 
     * 
     * <h3><a id="Security_Considerations"></a><a id="security_considerations"></a><a id="SECURITY_CONSIDERATIONS"></a>Security Considerations</h3>
     * Using this function incorrectly might compromise the security of your program. Incorrect use of this function includes not correctly specifying the size of the <i>lpBuffer</i> parameter. 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines GetAtomName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {IModelObject} contextObject 
     * @param {Integer} indexerCount 
     * @param {Pointer<IModelObject>} indexers 
     * @param {Pointer<IModelObject>} _object 
     * @param {Pointer<IKeyStore>} metadata 
     * @returns {HRESULT} Type: <b>UINT</b>
     * 
     * If the function succeeds, the return value is the length of the string copied to the buffer, in 
     * 						characters, not including the terminating null character.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getatomnamea
     */
    GetAt(contextObject, indexerCount, indexers, _object, metadata) {
        result := ComCall(4, this, "ptr", contextObject, "uint", indexerCount, "ptr*", indexers, "ptr*", _object, "ptr*", metadata, "HRESULT")
        return result
    }

    /**
     * Sets or alters attributes of properties on an IMessage object supplied by the OpenIMsgOnIStg function.
     * @remarks
     * Property attributes can only be accessed on property objects, that is, objects implementing the [IMAPIProp : IUnknown](imapipropiunknown.md) interface. To make MAPI properties available on an OLE structured storage object, [OpenIMsgOnIStg](openimsgonistg.md) builds an [IMessage : IMAPIProp](imessageimapiprop.md) object on top of the OLE **IStorage** object. The property attributes on such objects can be set or altered with **SetAttribIMsgOnIStg** and retrieved with [GetAttribIMsgOnIStg](getattribimsgonistg.md). 
     *   
     *  **Note** **GetAttribIMsgOnIStg** and **SetAttribIMsgOnIStg** do not operate on all **IMessage** objects. They are only valid for **IMessage**-on- **IStorage** objects returned by **OpenIMsgOnIStg**. 
     *   
     * In the  _lpPropAttrs_ parameter, the number and position of the attributes must match the number and position of the property tags passed in the _lpPropTags_ parameter. 
     *   
     * The **SetAttribIMsgOnIStg** function is used to make message properties read-only when required by the **IMessage** schema. The sample message store provider uses it for this purpose. For more information, see [Messages](mapi-messages.md).
     * @param {IModelObject} contextObject 
     * @param {Integer} indexerCount 
     * @param {Pointer<IModelObject>} indexers 
     * @param {IModelObject} value 
     * @returns {HRESULT} S_OK 
     *   
     * > The call succeeded and has returned the expected value or values.
     *     
     * MAPI_W_ERRORS_RETURNED 
     *   
     * > The call succeeded overall, but one or more properties could not be accessed and were returned with a property type of PT_ERROR.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/setattribimsgonistg
     */
    SetAt(contextObject, indexerCount, indexers, value) {
        result := ComCall(5, this, "ptr", contextObject, "uint", indexerCount, "ptr*", indexers, "ptr", value, "HRESULT")
        return result
    }
}
