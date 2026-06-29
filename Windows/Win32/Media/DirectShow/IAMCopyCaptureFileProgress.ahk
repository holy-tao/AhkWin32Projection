#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAMCopyCaptureFileProgress interface is a callback interface used by the ICaptureGraphBuilder2::CopyCaptureFile method.Because the CopyCaptureFile method can take a long time to complete, an application can implement this interface to receive periodic notifications about the progress of the copy operation. If the application does not need to receive this information, there is no need to implement the interface.
 * @remarks
 * To use this interface, implement a class that inherits the interface and implements all of its methods, including the methods in <b>IUnknown</b>. In your application, create an instance of the class and pass it to the <b>CopyCaptureFile</b> method. You do not have to implement COM reference counting in your class, as long as the object is guaranteed not to be deleted before the <b>CopyCaptureFile</b> method returns.
 * 
 * The following example shows a class that implements the interface:
 * 
 * <div class="code"><span><table>
 * <tr>
 * <th>C++</th>
 * </tr>
 * <tr>
 * <td>
 * 
 * ```
 * class CProgress : public IAMCopyCaptureFileProgress 
 * {
 * public:
 *     STDMETHODIMP_(ULONG) AddRef() { return 1; }
 *     STDMETHODIMP_(ULONG) Release() { return 0; }
 *     STDMETHODIMP QueryInterface(REFIID iid, void **ppv) 
 *     {
 *         if  (ppv == NULL) 
 *         {
 *             return E_POINTER;
 *         }
 *         else if (iid == __uuidof(IUnknown))
 *         {
 *             *ppv = static_cast&lt;IUnknown*&gt;(this);
 *         }
 *         else if (iid == IID_IAMCopyCaptureFileProgress) 
 *         {
 *             *ppv = static_cast&lt;IAMCopyCaptureFileProgress*&gt;(this);
 *         }
 *         else
 *         {
 *             return E_NOINTERFACE;
 *         }
 *         return S_OK;
 *     }
 *     STDMETHODIMP Progress(int iPercent) 
 *     {
 *         if (iPercent &lt; 0 || iPercent &gt; 100) 
 *         {
 *             return E_INVALIDARG;
 *         }
 * 
 *         TCHAR szMsg[32];
 *         StringCchPrintf(szMsg, 32, TEXT("Progress: %d%%"), iPercent);
 *         // Assume g_hwndStatus is a valid HWND.
 *         SetWindowText(g_hwndStatus, szMsg);  
 * 
 *         return S_OK;
 *     };
 * };
 * ```
 * </td>
 * </tr>
 * </table></span></div>
 * The following example uses this class in the <b>CopyCaptureFile</b> method:
 * 
 * <div class="code"><span><table>
 * <tr>
 * <th>C++</th>
 * </tr>
 * <tr>
 * <td>
 * <pre>
 * // Scope for CProgress object
 * {
 *     CProgress Prog;
 *     // Assume pBuilder is an initialized ICaptureGraphBuilder2 pointer.
 *     hr = pBuilder-&gt;CopyCaptureFile(szCaptureFile, szDestFile, TRUE,
 *         static_cast&lt;IAMCopyCaptureFileProgress*&gt;(&amp;Prog));
 * }
 * </pre>
 * </td>
 * </tr>
 * </table></span></div>
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iamcopycapturefileprogress
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMCopyCaptureFileProgress extends IUnknown {
    /**
     * The interface identifier for IAMCopyCaptureFileProgress
     * @type {Guid}
     */
    static IID := Guid("{670d1d20-a068-11d0-b3f0-00aa003761c5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMCopyCaptureFileProgress interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Progress : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMCopyCaptureFileProgress.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Progress method is called periodically by the ICaptureGraphBuilder2::CopyCaptureFile method while it copies the file.
     * @remarks
     * Applications typically use the value of <i>iProgress</i> to update a progress bar on the user interface.
     * @param {Integer} iProgress Specifies the percentage of the copy operation that has completed, as a value between 0 and 100.
     * @returns {HRESULT} Returns S_OK or an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamcopycapturefileprogress-progress
     */
    Progress(iProgress) {
        result := ComCall(3, this, "int", iProgress, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAMCopyCaptureFileProgress.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Progress := CallbackCreate(GetMethod(implObj, "Progress"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Progress)
    }
}
