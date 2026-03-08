#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IRequiredExtensions interface is introduced in MMC 1.1.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/nn-mmc-irequiredextensions
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IRequiredExtensions extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRequiredExtensions
     * @type {Guid}
     */
    static IID => Guid("{72782d7a-a4a0-11d1-af0f-00c04fb6dd2c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnableAllExtensions", "GetFirstExtension", "GetNextExtension"]

    /**
     * The IRequiredExtensions::EnableAllExtensions method enables the snap-in to specify that all extension snap-ins registered for the snap-in are required.
     * @remarks
     * If this method returns S_OK, MMC adds all registered extensions. If any other value is returned, MMC calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-irequiredextensions-getfirstextension">IRequiredExtensions::GetFirstExtension</a> to attempt to add the first required extension of the snap-in's list of required extensions.
     * 
     * If one of the required extensions can't be loaded, MMC skips it and continues to query the snap-in for the rest of them. There is no indication back to the snap-in when an extension fails to load.
     * 
     * If all extensions are requested, they are loaded in the order in which they are found in the registry. First, all the registered node types for the snap-in are read. Then, for each node type, all the extensions are read in the following order: namespace, context menu, toolbar, property sheet, taskpad.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-irequiredextensions-enableallextensions
     */
    EnableAllExtensions() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Enables the snap-in to specify the first extension snap-in its list of required extension snap-ins.
     * @remarks
     * MMC calls this method if 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-irequiredextensions-enableallextensions">IRequiredExtensions::EnableAllExtensions</a> returns a value that is not S_OK.
     * 
     * If this method returns S_OK, MMC adds the extension snap-in specified by pExtCLSID and then calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-irequiredextensions-getnextextension">IRequiredExtensions::GetNextExtension</a> to get the next extension snap-in in the list. If any other value is returned, MMC treats the required list as if it were empty by not adding the extension snap-in specified by pExtCLSID and not calling <b>IRequiredExtensions::GetNextExtension</b>.
     * @returns {Guid} A pointer to the CLSID of the first snap-in in the list of required extension snap-ins.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-irequiredextensions-getfirstextension
     */
    GetFirstExtension() {
        pExtCLSID := Guid()
        result := ComCall(4, this, "ptr", pExtCLSID, "HRESULT")
        return pExtCLSID
    }

    /**
     * Enables the snap-in to specify the next extension snap-in in its list of required extension snap-ins.
     * @remarks
     * MMC calls the method for the first time if 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-irequiredextensions-getfirstextension">IRequiredExtensions::GetFirstExtension</a> returns an S_OK value. MMC iterates the list of required extensions to add by calling <b>IRequiredExtensions::GetNextExtension</b> until it returns a value other than S_OK.
     * 
     * If this method returns S_OK, MMC adds the extension snap-in specified by pExtCLSID and then calls <b>IRequiredExtensions::GetNextExtension</b> again to get the next extension snap-in in the list.
     * 
     * If another value is returned, MMC considers the return an indicator of the end of the list. In this case, MMC does not add the extension snap-in specified by pExtCLSID and stops calling <b>IRequiredExtensions::GetNextExtension</b>.
     * @returns {Guid} A pointer to the CLSID of the next snap-in in the list of required extension snap-ins.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-irequiredextensions-getnextextension
     */
    GetNextExtension() {
        pExtCLSID := Guid()
        result := ComCall(5, this, "ptr", pExtCLSID, "HRESULT")
        return pExtCLSID
    }
}
