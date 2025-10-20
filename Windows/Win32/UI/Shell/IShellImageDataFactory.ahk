#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that create IShellImageData instances based on various image sources.
 * @remarks
 * 
  * This interface is not expected to be available in later versions of Windows. It is recommended that Windows GDI+ APIs be used in place of <b>IShellImageDataFactory</b> methods.
  * 
  * This interface was not included in a public header file prior to Windows Vista.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shimgdata/nn-shimgdata-ishellimagedatafactory
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellImageDataFactory extends IUnknown{
    /**
     * The interface identifier for IShellImageDataFactory
     * @type {Guid}
     */
    static IID => Guid("{9be8ed5c-edab-4d75-90f3-bd5bdbb21c82}")

    /**
     * The class identifier for ShellImageDataFactory
     * @type {Guid}
     */
    static CLSID => Guid("{66e4e4fb-f385-4dd0-8d74-a2efd1bc6178}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IShellImageData>} ppshimg 
     * @returns {HRESULT} 
     */
    CreateIShellImageData(ppshimg) {
        result := ComCall(3, this, "ptr", ppshimg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {Pointer<IShellImageData>} ppshimg 
     * @returns {HRESULT} 
     */
    CreateImageFromFile(pszPath, ppshimg) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(4, this, "ptr", pszPath, "ptr", ppshimg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} pStream 
     * @param {Pointer<IShellImageData>} ppshimg 
     * @returns {HRESULT} 
     */
    CreateImageFromStream(pStream, ppshimg) {
        result := ComCall(5, this, "ptr", pStream, "ptr", ppshimg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {Pointer<Guid>} pDataFormat 
     * @returns {HRESULT} 
     */
    GetDataFormatFromPath(pszPath, pDataFormat) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(6, this, "ptr", pszPath, "ptr", pDataFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
