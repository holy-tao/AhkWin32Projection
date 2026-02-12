#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IPersist.ahk

/**
 * Exposes a method that initializes Shell folder objects.
 * @remarks
 * When you implement a Shell namespace extension, specifically the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> interface, you must implement this interface so the folder object can be initialized. Implementation of this interface is how the folder is told where it is in the Shell namespace.
 * 
 * You do not use this interface directly. It is used by the file system implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-bindtoobject">IShellFolder::BindToObject</a> interface when it is initializing a Shell folder object.
 * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nn-shobjidl_core-ipersistfolder
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IPersistFolder extends IPersist{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPersistFolder
     * @type {Guid}
     */
    static IID => Guid("{000214ea-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize"]

    /**
     * Instructs a Shell folder object to initialize itself based on the information passed.
     * @remarks
     * All objects that implement the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> interface for use in the Shell's namespace must implement this method. When a folder's location in the namespace is not a relevant consideration, this method can simply return S_OK. When the location is relevant to the folder, you should store the fully qualified IDLIST passed in for later reference.
     * 
     * For example, if the folder implementation needs to construct a fully qualified pointer to an item identifier list (PIDL) to elements that it contains, the PIDL passed to this method should be used to construct the fully qualified PIDLs.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>LPCITEMIDLIST</b>
     * 
     * The address of the <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a> (item identifier list) structure that specifies the absolute location of the folder.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ipersistfolder-initialize
     */
    Initialize(pidl) {
        result := ComCall(4, this, "ptr", pidl, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
