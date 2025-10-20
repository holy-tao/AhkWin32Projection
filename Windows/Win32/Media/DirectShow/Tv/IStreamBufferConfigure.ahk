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
     * 
     * @param {PWSTR} pszDirectoryName 
     * @returns {HRESULT} 
     */
    SetDirectory(pszDirectoryName) {
        pszDirectoryName := pszDirectoryName is String ? StrPtr(pszDirectoryName) : pszDirectoryName

        result := ComCall(3, this, "ptr", pszDirectoryName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszDirectoryName 
     * @returns {HRESULT} 
     */
    GetDirectory(ppszDirectoryName) {
        result := ComCall(4, this, "ptr", ppszDirectoryName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwMin 
     * @param {Integer} dwMax 
     * @returns {HRESULT} 
     */
    SetBackingFileCount(dwMin, dwMax) {
        result := ComCall(5, this, "uint", dwMin, "uint", dwMax, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwMin 
     * @param {Pointer<UInt32>} pdwMax 
     * @returns {HRESULT} 
     */
    GetBackingFileCount(pdwMin, pdwMax) {
        result := ComCall(6, this, "uint*", pdwMin, "uint*", pdwMax, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwSeconds 
     * @returns {HRESULT} 
     */
    SetBackingFileDuration(dwSeconds) {
        result := ComCall(7, this, "uint", dwSeconds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwSeconds 
     * @returns {HRESULT} 
     */
    GetBackingFileDuration(pdwSeconds) {
        result := ComCall(8, this, "uint*", pdwSeconds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
