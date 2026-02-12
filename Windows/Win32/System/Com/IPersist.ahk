#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Provides the CLSID of an object that can be stored persistently in the system. Allows the object to specify which object handler to use in the client process, as it is used in the default implementation of marshaling.
 * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nn-objidl-ipersist
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IPersist extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPersist
     * @type {Guid}
     */
    static IID => Guid("{0000010c-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetClassID"]

    /**
     * Retrieves the class identifier (CLSID) of the object.
     * @remarks
     * The <b>GetClassID</b> method retrieves the class identifier (CLSID) for an object, used in later operations to load object-specific code into the caller's context.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * A container application might call this method to retrieve the original CLSID of an object that it is treating as a different class. Such a call would be necessary if a user performed an editing operation that required the object to be saved. If the container were to save it using the treat-as CLSID, the original application would no longer be able to edit the object. Typically, in this case, the container calls the <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olesave">OleSave</a> helper function, which performs all the necessary steps. For this reason, most container applications have no need to call this method directly.
     * 
     * The exception would be a container that provides an object handler for certain objects. In particular, a container application should not get an object's CLSID and then use it to retrieve class specific information from the registry. Instead, the container should use <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleobject">IOleObject</a> and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interfaces to retrieve such class-specific information directly from the object.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Typically, implementations of this method simply supply a constant CLSID for an object. If, however, the object's <b><a href="https://docs.microsoft.com/windows/desktop/com/treatas">TreatAs</a></b> registry key has been set by an application that supports emulation (and so is treating the object as one of a different class), a call to <b>GetClassID</b> must supply the CLSID specified in the <b><a href="https://docs.microsoft.com/windows/desktop/com/treatas">TreatAs</a></b> key. For more information on emulation, see <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-cotreatasclass">CoTreatAsClass</a>.
     * 
     * When an object is in the running state, the default handler calls an implementation of <b>GetClassID</b> that delegates the call to the implementation in the object. When the object is not running, the default handler instead calls the <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-readclassstg">ReadClassStg</a> function to read the CLSID that is saved in the object's storage.
     * 
     * If you are writing a custom object handler for your object, you might want to simply delegate this method to the default handler implementation (see <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olecreatedefaulthandler">OleCreateDefaultHandler</a>). 
     * 
     * 
     * <h3><a id="URL_Moniker_Notes"></a><a id="url_moniker_notes"></a><a id="URL_MONIKER_NOTES"></a>URL Moniker Notes</h3>
     * This method returns CLSID_StdURLMoniker.
     * @returns {Guid} A pointer to the location that receives the CLSID on return. The CLSID is a globally unique identifier (GUID) that uniquely represents an object class that defines the code that can manipulate the object's data.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-ipersist-getclassid
     */
    GetClassID() {
        pClassID := Guid()
        result := ComCall(3, this, "ptr", pClassID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pClassID
    }
}
