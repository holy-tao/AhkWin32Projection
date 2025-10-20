#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMReaderPlaylistBurn interface verifies that the files in a playlist can be copied to CD, in the order in which they are specified.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmreaderplaylistburn
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMReaderPlaylistBurn extends IUnknown{
    /**
     * The interface identifier for IWMReaderPlaylistBurn
     * @type {Guid}
     */
    static IID => Guid("{f28c0300-9baa-4477-a846-1744d9cbf533}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} cFiles 
     * @param {Pointer<PWSTR>} ppwszFilenames 
     * @param {Pointer<IWMStatusCallback>} pCallback 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} 
     */
    InitPlaylistBurn(cFiles, ppwszFilenames, pCallback, pvContext) {
        result := ComCall(3, this, "uint", cFiles, "ptr", ppwszFilenames, "ptr", pCallback, "ptr", pvContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cFiles 
     * @param {Pointer<HRESULT>} phrStati 
     * @returns {HRESULT} 
     */
    GetInitResults(cFiles, phrStati) {
        result := ComCall(4, this, "uint", cFiles, "ptr", phrStati, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Cancel() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HRESULT} hrBurnResult 
     * @returns {HRESULT} 
     */
    EndPlaylistBurn(hrBurnResult) {
        result := ComCall(6, this, "int", hrBurnResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
