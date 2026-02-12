#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IModelObject.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IModelPropertyAccessor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IModelPropertyAccessor
     * @type {Guid}
     */
    static IID => Guid("{5a0c63d9-0526-42b8-960c-9516a3254c85}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetValue", "SetValue"]

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetValueAndName
     * @param {PWSTR} key 
     * @param {IModelObject} contextObject 
     * @returns {Pointer<IModelObject>} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wmformat/iwmcodecmetadata-getvalueandname
     */
    GetValue(key, contextObject) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(3, this, "ptr", key, "ptr", contextObject, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * SetValue Method (ServerSettingsGeneralFlag Class)
     * @param {PWSTR} key 
     * @param {IModelObject} contextObject 
     * @param {IModelObject} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/wmi-provider-configuration-classes/serversettingsgeneralflag-class/setvalue-method-serversettingsgeneralflag-class
     */
    SetValue(key, contextObject, value) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(4, this, "ptr", key, "ptr", contextObject, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
