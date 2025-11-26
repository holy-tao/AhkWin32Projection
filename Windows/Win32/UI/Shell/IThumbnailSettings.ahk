#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a method that enables a thumbnail provider to determine the user context of a thumbnail request.
 * @remarks
 * 
 * <h3><a id="When_to_implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to implement</h3>
 * This interface can be implemented by any thumbnail provider that supports <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iextractimage">IExtractImage</a> or <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/nn-thumbcache-ithumbnailprovider">IThumbnailProvider</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//thumbcache/nn-thumbcache-ithumbnailsettings
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IThumbnailSettings extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IThumbnailSettings
     * @type {Guid}
     */
    static IID => Guid("{f4376f00-bef5-4d45-80f3-1e023bbf1209}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetContext"]

    /**
     * Enables a thumbnail provider to return a thumbnail specific to the user's context.
     * @param {Integer} dwContext Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/ne-thumbcache-wts_contextflags">WTS_CONTEXTFLAGS</a></b>
     * 
     * One or more flags that specify the context. This value is based on the <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/ne-thumbcache-wts_flags">WTS_FLAGS</a> values that are received by the thumbnail provider through the call to <a href="https://docs.microsoft.com/windows/desktop/api/thumbcache/nf-thumbcache-ithumbnailprovider-getthumbnail">IThumbnailProvider::GetThumbnail</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//thumbcache/nf-thumbcache-ithumbnailsettings-setcontext
     */
    SetContext(dwContext) {
        result := ComCall(3, this, "int", dwContext, "HRESULT")
        return result
    }
}
