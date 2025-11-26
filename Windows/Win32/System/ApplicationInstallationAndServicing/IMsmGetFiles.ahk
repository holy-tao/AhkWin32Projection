#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMsmStrings.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IMsmGetFiles interface enables the client to retrieve the files needed in a particular language of the module.
 * @see https://docs.microsoft.com/windows/win32/api//mergemod/nn-mergemod-imsmgetfiles
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IMsmGetFiles extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMsmGetFiles
     * @type {Guid}
     */
    static IID => Guid("{7041ae26-2d78-11d2-888a-00a0c981b015}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ModuleFiles"]

    /**
     * @type {IMsmStrings} 
     */
    ModuleFiles {
        get => this.get_ModuleFiles()
    }

    /**
     * 
     * @returns {IMsmStrings} 
     * @see https://learn.microsoft.com/windows/win32/api/mergemod/nf-mergemod-imsmgetfiles-get_modulefiles
     */
    get_ModuleFiles() {
        result := ComCall(7, this, "ptr*", &Files := 0, "HRESULT")
        return IMsmStrings(Files)
    }
}
