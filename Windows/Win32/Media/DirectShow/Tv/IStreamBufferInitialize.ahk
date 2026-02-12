#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IStreamBufferInitialize interface is used to configure the stream buffer filters. The Stream Buffer Source filter, Stream Buffer Sink filter, and StreamBufferConfig object all expose this interface.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IStreamBufferInitialize)</c>.
 * @see https://learn.microsoft.com/windows/win32/api//content/sbe/nn-sbe-istreambufferinitialize
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IStreamBufferInitialize extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamBufferInitialize
     * @type {Guid}
     */
    static IID => Guid("{9ce50f2d-6ba7-40fb-a034-50b1a674ec78}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetHKEY", "SetSIDs"]

    /**
     * The SetHKEY method sets the registry key where the stream buffer object stores its configuration information.
     * @remarks
     * This method enables an application to specify a registry key where the stream buffer objects will save configuration information, including the location of the backing files, the number of backing files, and their size.
     * 
     * You must call this method before the object is initialized, either explicitly or implicitly. For the Stream Buffer Sink filter, call the method before the profile is locked. For the Stream Buffer Source filter, call the method before setting the source file name.
     * 
     * To use this method, do the following:
     * 
     * <ol>
     * <li>Create a new registry key or open an existing key.</li>
     * <li>Create an instance of the <b>StreamBufferConfig</b> object.</li>
     * <li>Query the <b>StreamBufferConfig</b> object for the <b>IStreamBufferInitialize</b> interface.</li>
     * <li>Call <b>SetHKey</b> on the <b>StreamBufferConfig</b> object, with a handle to the registry key.</li>
     * <li>Optionally, call <b>IStreamBufferConfigure</b> methods to modify the configuration information that will be stored in the registry key.</li>
     * <li>Call <b>SetHKey</b> on the Stream Buffer Source filter and the Stream Buffer Sink filter, using the same registry key.</li>
     * </ol>
     * The application is responsible for ensuring that the user has read/write permissions for the registry key.
     * 
     * The caller may release the registry key handle after calling this method.
     * @param {HKEY} hkeyRoot Handle to the registry key.
     * @returns {HRESULT} Returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>SetHKEY</b> was called on a filter after it initialized internally.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/sbe/nf-sbe-istreambufferinitialize-sethkey
     */
    SetHKEY(hkeyRoot) {
        hkeyRoot := hkeyRoot is Win32Handle ? NumGet(hkeyRoot, "ptr") : hkeyRoot

        result := ComCall(3, this, "ptr", hkeyRoot, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetSIDs method sets the security identifiers (SIDs) that are used to protect access to the backing files.
     * @remarks
     * At run time, the Stream Buffer Source and Sink filters create various Win32 objects, such as mutexes, so that access to the backing files is synchronized across threads. Each of the filters maintains a list of SIDs that are used to protect these objects. By default, the filters inherit their SIDs from the hosting process. An application can use the <b>SetSIDs</b> method to override the default SIDs.
     * 
     * If you call this method, do so before locking the sink filter or loading a file in the source filter. It is recommended that all of the filters be given the same SIDs.
     * 
     * <ul>
     * <li>
     * <div class="alert"><b>Important</b>  Setting less-privileged SIDs can create a security issue.</div>
     * <div> </div>
     * </li>
     * </ul>
     * Note that this method does not apply to content recording files, which are protected by the discretionary access-control lists (DACLs) of the directory structure.
     * @param {Integer} cSIDs Specifies the size of the array given in the <i>ppSID</i> parameter.
     * @param {Pointer<PSID>} ppSID Pointer to an array of <b>SID</b> structures, of size <i>cSIDs</i>.
     * @returns {HRESULT} Returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Null pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/sbe/nf-sbe-istreambufferinitialize-setsids
     */
    SetSIDs(cSIDs, ppSID) {
        ppSIDMarshal := ppSID is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "uint", cSIDs, ppSIDMarshal, ppSID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
