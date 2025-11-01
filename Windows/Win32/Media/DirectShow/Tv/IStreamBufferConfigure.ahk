#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IStreamBufferConfigure interface configures the location, number, and size of the backing files used by the various stream buffer objects.The StreamBufferConfig object exposes this interface.Before calling any of the Set methods on this interface, you must specify a registry key to hold the new settings. For more information, see IStreamBufferInitialize::SetHKEY.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IStreamBufferConfigure)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//sbe/nn-sbe-istreambufferconfigure
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IStreamBufferConfigure extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamBufferConfigure
     * @type {Guid}
     */
    static IID => Guid("{ce14dfae-4098-4af7-bbf7-d6511f835414}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDirectory", "GetDirectory", "SetBackingFileCount", "GetBackingFileCount", "SetBackingFileDuration", "GetBackingFileDuration"]

    /**
     * 
     * @param {PWSTR} pszDirectoryName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambufferconfigure-setdirectory
     */
    SetDirectory(pszDirectoryName) {
        pszDirectoryName := pszDirectoryName is String ? StrPtr(pszDirectoryName) : pszDirectoryName

        result := ComCall(3, this, "ptr", pszDirectoryName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszDirectoryName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambufferconfigure-getdirectory
     */
    GetDirectory(ppszDirectoryName) {
        result := ComCall(4, this, "ptr", ppszDirectoryName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMin 
     * @param {Integer} dwMax 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambufferconfigure-setbackingfilecount
     */
    SetBackingFileCount(dwMin, dwMax) {
        result := ComCall(5, this, "uint", dwMin, "uint", dwMax, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwMin 
     * @param {Pointer<Integer>} pdwMax 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambufferconfigure-getbackingfilecount
     */
    GetBackingFileCount(pdwMin, pdwMax) {
        result := ComCall(6, this, "uint*", pdwMin, "uint*", pdwMax, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSeconds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambufferconfigure-setbackingfileduration
     */
    SetBackingFileDuration(dwSeconds) {
        result := ComCall(7, this, "uint", dwSeconds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwSeconds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambufferconfigure-getbackingfileduration
     */
    GetBackingFileDuration(pdwSeconds) {
        result := ComCall(8, this, "uint*", pdwSeconds, "HRESULT")
        return result
    }
}
