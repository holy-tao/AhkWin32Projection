#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Retrieves information about an assembly when using managed code in the .NET Framework common language runtime.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-iassemblylocator
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IAssemblyLocator extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAssemblyLocator
     * @type {Guid}
     */
    static IID => Guid("{391ffbb9-a8ee-432a-abc8-baa238dab90f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetModules"]

    /**
     * 
     * @param {BSTR} applicationDir 
     * @param {BSTR} applicationName 
     * @param {BSTR} assemblyName 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iassemblylocator-getmodules
     */
    GetModules(applicationDir, applicationName, assemblyName) {
        applicationDir := applicationDir is String ? BSTR.Alloc(applicationDir).Value : applicationDir
        applicationName := applicationName is String ? BSTR.Alloc(applicationName).Value : applicationName
        assemblyName := assemblyName is String ? BSTR.Alloc(assemblyName).Value : assemblyName

        result := ComCall(7, this, "ptr", applicationDir, "ptr", applicationName, "ptr", assemblyName, "ptr*", &pModules := 0, "HRESULT")
        return pModules
    }
}
