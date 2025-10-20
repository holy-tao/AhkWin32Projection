#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDShowPlugin interface enables the Windows Media Source filter to communicate with the Windows Media Player 6.4 Plug-in for Netscape Navigator.
 * @remarks
 * 
  * To define the interface identifier, include the header file Initguid.h before Qnetwork.h, but after Dshow.h and other header files:
  * 
  * <pre class="syntax" xml:space="preserve"><code>#include &lt;dshow.h&gt;
  * 
 * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nn-qnetwork-idshowplugin
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IDShowPlugin extends IUnknown{
    /**
     * The interface identifier for IDShowPlugin
     * @type {Guid}
     */
    static IID => Guid("{4746b7c8-700e-11d1-becc-00c04fb6e937}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BSTR>} pURL 
     * @returns {HRESULT} 
     */
    get_URL(pURL) {
        result := ComCall(3, this, "ptr", pURL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pUserAgent 
     * @returns {HRESULT} 
     */
    get_UserAgent(pUserAgent) {
        result := ComCall(4, this, "ptr", pUserAgent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
