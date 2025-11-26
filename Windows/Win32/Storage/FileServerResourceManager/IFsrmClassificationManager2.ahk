#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFsrmClassificationManager.ahk

/**
 * Manages file classification. Use this interface to define properties to use in classification, add classification rules for classifying files, define classification and storage modules, and enable classification reporting.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nn-fsrmpipeline-ifsrmclassificationmanager2
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmClassificationManager2 extends IFsrmClassificationManager{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmClassificationManager2
     * @type {Guid}
     */
    static IID => Guid("{0004c1c9-127e-4765-ba07-6a3147bca112}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 34

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ClassifyFiles"]

    /**
     * This method is used to perform bulk enumeration, setting, and clearing of file properties.
     * @param {Pointer<SAFEARRAY>} filePaths A list of the file paths.  The <b>SAFEARRAY</b> contains variants of type 
     *       <b>VT_BSTR</b>. For each item in the array, use the <b>bstrVal</b> member 
     *       to access the property name.
     * @param {Pointer<SAFEARRAY>} propertyNames A list of the property names.  The <b>SAFEARRAY</b> contains variants of type 
     *       <b>VT_BSTR</b>. For each item in the array, use the <b>bstrVal</b> member 
     *       to access the property name.
     * @param {Pointer<SAFEARRAY>} propertyValues A list of the property values.
     * @param {Integer} options Options for the operation as enumerated by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmgetfilepropertyoptions">FsrmGetFilePropertyOptions</a> enumeration. The 
     *       default value is <b>FsrmGetFilePropertyOptions_None</b>.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationmanager2-classifyfiles
     */
    ClassifyFiles(filePaths, propertyNames, propertyValues, options) {
        result := ComCall(34, this, "ptr", filePaths, "ptr", propertyNames, "ptr", propertyValues, "int", options, "HRESULT")
        return result
    }
}
