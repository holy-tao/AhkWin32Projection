#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Retrieves the activity identifier associated with the current object context.
 * @remarks
 * 
 * You obtain a reference to an object's <b>IObjectContextActivity</b> interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on the object's context, as in the following example:
 * 
 * <pre class="syntax" xml:space="preserve"><code>hr = m_pIObjectContext-&gt;QueryInterface(
 *             IID_IObjectContextActivity, 
 *             (void**)&amp;m_pIObjectContextActivity);
 * </code></pre>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-iobjectcontextactivity
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IObjectContextActivity extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IObjectContextActivity
     * @type {Guid}
     */
    static IID => Guid("{51372afc-cae7-11cf-be81-00aa00a2fa25}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetActivityId"]

    /**
     * Retrieves the GUID associated with the current activity.
     * @param {Pointer<Guid>} pGUID A reference to the GUID associated with the current activity.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iobjectcontextactivity-getactivityid
     */
    GetActivityId(pGUID) {
        result := ComCall(3, this, "ptr", pGUID, "HRESULT")
        return result
    }
}
