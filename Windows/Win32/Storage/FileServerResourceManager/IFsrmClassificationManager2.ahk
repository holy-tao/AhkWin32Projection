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
     * 
     * @param {Pointer<SAFEARRAY>} filePaths 
     * @param {Pointer<SAFEARRAY>} propertyNames 
     * @param {Pointer<SAFEARRAY>} propertyValues 
     * @param {Integer} options 
     * @returns {HRESULT} 
     */
    ClassifyFiles(filePaths, propertyNames, propertyValues, options) {
        result := ComCall(34, this, "ptr", filePaths, "ptr", propertyNames, "ptr", propertyValues, "int", options, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
