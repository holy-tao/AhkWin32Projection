#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implemented by components that provide input trust authorities (ITAs). This interface is used to get the ITA for each of the component's streams.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imftrustedinput
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFTrustedInput extends IUnknown{
    /**
     * The interface identifier for IMFTrustedInput
     * @type {Guid}
     */
    static IID => Guid("{542612c4-a1b8-4632-b521-de11ea64a0b0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppunkObject 
     * @returns {HRESULT} 
     */
    GetInputTrustAuthority(dwStreamID, riid, ppunkObject) {
        result := ComCall(3, this, "uint", dwStreamID, "ptr", riid, "ptr", ppunkObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
