#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * Provides an object with a property bag in which the object can save its properties persistently.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/nn-oaidl-ipropertybag
 * @namespace Windows.Win32.System.Com.StructuredStorage
 * @version v4.0.30319
 */
class IPropertyBag extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertyBag
     * @type {Guid}
     */
    static IID => Guid("{55272a00-42cb-11ce-8135-00aa004bb851}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Read", "Write"]

    /**
     * Reads the named property into a caller-initialized VARIANT.
     * @remarks
     * The **Read** method tells the property bag to read the property named in *pszPropName* to the caller-initialized VARIANT in *pVar*. Errors are logged in the error log that is pointed to by *pErrorLog*. When `pVar->vt` specifies another object pointer (VT_UNKNOWN), the property bag is responsible for creating and initializing the object described by *pszPropName*.
     * 
     * E_NOTIMPL is not a valid return code, because any object that implements this interface must support the entire functionality of the interface.
     * @param {PWSTR} pszPropName The address of the name of the property to read. This cannot be NULL.
     * @param {Pointer<VARIANT>} pVar The address of the caller-initialized VARIANT that receives the property value on output. The function sets the type field and the value field in the VARIANT before it returns. If the caller initialized the `pVar->vt` field on entry, the property bag attempts to change its corresponding value to this type. If the caller sets `pVar->vt` to VT_EMPTY, the property bag can use whatever type is convenient.
     * @param {IErrorLog} pErrorLog The address of the caller's error log in which the property bag stores any errors that occur during reads. This can be NULL; in which case, the caller does not receive errors.
     * @returns {HRESULT} An HRESULT
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-ipropertybag-read
     */
    Read(pszPropName, pVar, pErrorLog) {
        pszPropName := pszPropName is String ? StrPtr(pszPropName) : pszPropName

        result := ComCall(3, this, "ptr", pszPropName, "ptr", pVar, "ptr", pErrorLog, "HRESULT")
        return result
    }

    /**
     * Save the named property in a caller-initialized VARIANT.
     * @remarks
     * The **Write** method tells the property bag to save the property named with *pszPropName* by using the type and value in the caller-initialized VARIANT in *pVar*. In some cases, the caller might be telling the property bag to save another object, for example, when `pVar->vt` is VT_UNKNOWN. In such cases, the property bag queries this object pointer for a persistence interface, such as IPersistStream or IPersistPropertyBag, and has that object save its data as well. Usually this results in the property bag having some byte array for this object, which can be saved as encoded text, such as hexadecimal string, MIME, and so on. When the property bag is later used to reinitialize a control, the client that owns the property bag must re-create the object when the caller asks for it, initializing that object with the previously saved bits.
     * 
     * This allows efficient persistence operations for Binary Large Object (BLOB) properties, such as a picture, where the owner of the property bag tells the picture object (which is managed as a property in the control that is saved) to save to a specific location. This avoids potential extra copy operations that might be involved with other property-based persistence mechanisms.
     * 
     * E_NOTIMPL is not a valid return code, because any object that implements this interface must support the entire functionality of the interface.
     * @param {PWSTR} pszPropName The address of a string containing the name of the property to write. This cannot be NULL.
     * @param {Pointer<VARIANT>} pVar The address of the caller-initialized VARIANT that holds the property value to save. The caller owns this VARIANT, and is responsible for all of its allocations. That is, the property bag does not attempt to free data in the VARIANT.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-ipropertybag-write
     */
    Write(pszPropName, pVar) {
        pszPropName := pszPropName is String ? StrPtr(pszPropName) : pszPropName

        result := ComCall(4, this, "ptr", pszPropName, "ptr", pVar, "HRESULT")
        return result
    }
}
