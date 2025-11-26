#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMCopyCaptureFileProgress interface is a callback interface used by the ICaptureGraphBuilder2::CopyCaptureFile method.Because the CopyCaptureFile method can take a long time to complete, an application can implement this interface to receive periodic notifications about the progress of the copy operation. If the application does not need to receive this information, there is no need to implement the interface.
 * @remarks
 * 
 * To use this interface, implement a class that inherits the interface and implements all of its methods, including the methods in <b>IUnknown</b>. In your application, create an instance of the class and pass it to the <b>CopyCaptureFile</b> method. You do not have to implement COM reference counting in your class, as long as the object is guaranteed not to be deleted before the <b>CopyCaptureFile</b> method returns.
 * 
 * The following example shows a class that implements the interface:
 * 
 * <div class="code"><span codelanguage="ManagedCPlusPlus"><table>
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
 * <div class="code"><span codelanguage="ManagedCPlusPlus"><table>
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
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamcopycapturefileprogress
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMCopyCaptureFileProgress extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMCopyCaptureFileProgress
     * @type {Guid}
     */
    static IID => Guid("{670d1d20-a068-11d0-b3f0-00aa003761c5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Progress"]

    /**
     * The Progress method is called periodically by the ICaptureGraphBuilder2::CopyCaptureFile method while it copies the file.
     * @param {Integer} iProgress Specifies the percentage of the copy operation that has completed, as a value between 0 and 100.
     * @returns {HRESULT} Returns S_OK or an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamcopycapturefileprogress-progress
     */
    Progress(iProgress) {
        result := ComCall(3, this, "int", iProgress, "HRESULT")
        return result
    }
}
