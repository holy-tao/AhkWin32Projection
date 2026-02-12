#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDataModelConcept extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataModelConcept
     * @type {Guid}
     */
    static IID => Guid("{fcb98d1d-1114-4fbf-b24c-effcb5def0d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeObject", "GetName"]

    /**
     * The InitializeObjectAttributes macro initializes the opaque OBJECT_ATTRIBUTES structure, which specifies the properties of an object handle to routines that open handles.
     * @remarks
     * <b>InitializeObjectAttributes</b> initializes an <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/wudfwdm/ns-wudfwdm-_object_attributes">OBJECT_ATTRIBUTES</a> structure that specifies the properties of an object handle to be opened. The caller can then pass a pointer to this structure to a routine that actually opens the handle. 
     * 
     * Driver routines that run in a process context other than that of the system process must set the OBJ_KERNEL_HANDLE flag for the <i>Attributes</i> parameter. This flag restricts the use of a handle opened for that object to processes running only in kernel mode. Otherwise, the handle can be accessed by the process in whose context the driver is running.
     * 
     * Note that <b>InitializeObjectAttributes</b> always sets the <b>SecurityQualityOfService</b> member of <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/wudfwdm/ns-wudfwdm-_object_attributes">OBJECT_ATTRIBUTES</a> to <b>NULL</b>. Drivers that require a non-<b>NULL</b> value can set <b>SecurityQualityOfService</b> directly.
     * @param {IModelObject} modelObject 
     * @param {IDebugHostTypeSignature} matchingTypeSignature 
     * @param {IDebugHostSymbolEnumerator} wildcardMatches 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/ntdef/nf-ntdef-initializeobjectattributes
     */
    InitializeObject(modelObject, matchingTypeSignature, wildcardMatches) {
        result := ComCall(3, this, "ptr", modelObject, "ptr", matchingTypeSignature, "ptr", wildcardMatches, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetName
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wmformat/iwmcodecstrings-getname
     */
    GetName() {
        modelName := BSTR()
        result := ComCall(4, this, "ptr", modelName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return modelName
    }
}
