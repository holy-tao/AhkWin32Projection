#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FsrmGetFilePropertyOptions.ahk" { FsrmGetFilePropertyOptions }
#Import ".\IFsrmClassificationManager.ahk" { IFsrmClassificationManager }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Manages file classification. Use this interface to define properties to use in classification, add classification rules for classifying files, define classification and storage modules, and enable classification reporting. (IFsrmClassificationManager2)
 * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nn-fsrmpipeline-ifsrmclassificationmanager2
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmClassificationManager2 extends IFsrmClassificationManager {
    /**
     * The interface identifier for IFsrmClassificationManager2
     * @type {Guid}
     */
    static IID := Guid("{0004c1c9-127e-4765-ba07-6a3147bca112}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmClassificationManager2 interfaces
    */
    struct Vtbl extends IFsrmClassificationManager.Vtbl {
        ClassifyFiles : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmClassificationManager2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This method is used to perform bulk enumeration, setting, and clearing of file properties.
     * @param {Pointer<SAFEARRAY>} filePaths A list of the file paths.  The <b>SAFEARRAY</b> contains variants of type 
     *       <b>VT_BSTR</b>. For each item in the array, use the <b>bstrVal</b> member 
     *       to access the property name.
     * @param {Pointer<SAFEARRAY>} propertyNames A list of the property names.  The <b>SAFEARRAY</b> contains variants of type 
     *       <b>VT_BSTR</b>. For each item in the array, use the <b>bstrVal</b> member 
     *       to access the property name.
     * @param {Pointer<SAFEARRAY>} propertyValues A list of the property values.
     * @param {FsrmGetFilePropertyOptions} options Options for the operation as enumerated by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmgetfilepropertyoptions">FsrmGetFilePropertyOptions</a> enumeration. The 
     *       default value is <b>FsrmGetFilePropertyOptions_None</b>.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager2-classifyfiles
     */
    ClassifyFiles(filePaths, propertyNames, propertyValues, options) {
        result := ComCall(34, this, SAFEARRAY.Ptr, filePaths, SAFEARRAY.Ptr, propertyNames, SAFEARRAY.Ptr, propertyValues, FsrmGetFilePropertyOptions, options, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFsrmClassificationManager2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ClassifyFiles := CallbackCreate(GetMethod(implObj, "ClassifyFiles"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ClassifyFiles)
    }
}
