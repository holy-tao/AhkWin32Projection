#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMoniker.ahk
#Include .\IEnumMoniker.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\IPersistStream.ahk

/**
 * Enables you to use a moniker object, which contains information that uniquely identifies a COM object.
 * @remarks
 * Like a path to a file in a file system, a moniker contains information that allows a COM object to be located and activated. Monikers can identify any type of COM object, from a document object stored in a file to a selection within an embedded object. COM provides a set of moniker classes that allow you to create moniker objects identifying the objects most commonly found in the system. For example, there might be an object representing a range of cells in a spreadsheet that is itself embedded in a text document stored in a file. In a distributed system, this object's moniker would identify the location of the object's system, the file's physical location on that system, the storage of the embedded object within that file, and, finally, the location of the range of cells within the embedded object.
 * 
 * 
 * 
 * A moniker object supports the <b>IMoniker</b> interface, which is derived from the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersiststream">IPersistStream</a> interface and uniquely identifies a single object in the system. After an object providing a moniker has created the moniker object, this information cannot be changed within that object. If the moniker provider changes the information, it can do so only by creating a new moniker object, which would then uniquely identify the object in question.
 * 
 * Monikers have the following two important capabilities: 
 * 
 * 
 * 
 * <ul>
 * <li>Monikers can be saved to a persistent storage. When a moniker is loaded back into memory, it still identifies the same object.</li>
 * <li>Monikers support an operation called binding, which is the process of locating the object named by the moniker, activating it (loading it into memory) if it is not already active, and returning a pointer to a requested interface on that object.</li>
 * </ul>
 * <h3><a id="Anti-Moniker_Implementation"></a><a id="anti-moniker_implementation"></a><a id="ANTI-MONIKER_IMPLEMENTATION"></a>Anti-Moniker Implementation</h3>
 * Anti-monikers are the inverse of the COM implementations of file, item, and pointer monikers. That is, an anti-moniker composed to the right of a file moniker, item moniker, or pointer moniker composes to nothing.
 * 
 * If you're a moniker client, you typically do not need to use anti-monikers. When you need the inverse of a moniker, you should call <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-inverse">IMoniker::Inverse</a>. For example, if you need an inverse to remove the last piece of a composite moniker, use <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-enum">IMoniker::Enum</a> to enumerate the pieces of the moniker and call <b>Inverse</b> on the rightmost piece. You should not use an anti-moniker for this purpose because you cannot be sure that the right-most piece of a composite considers an anti-moniker to be its inverse.
 * 
 * The only situation in which you should explicitly use an anti-moniker is when you are writing a new moniker class and you have no special requirements for constructing inverses to your monikers. In that situation, you can return anti-monikers from your implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-inverse">Inverse</a>. In your implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-composewith">IMoniker::ComposeWith</a>, you should then annihilate one of your monikers for every anti-moniker you encounter.
 * 
 * Use the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-createantimoniker">CreateAntiMoniker</a> function to create these monikers.
 * 
 * <h3><a id="Class_Moniker_Implementation"></a><a id="class_moniker_implementation"></a><a id="CLASS_MONIKER_IMPLEMENTATION"></a>Class Moniker Implementation</h3>
 * Class monikers are monikers that represent an object class. Class monikers bind to the class object of the class for which they are created.
 * 
 * Class monikers are most useful in composition with other types of monikers, such as file monikers or item monikers. Class monikers may also be composed to the right of monikers supporting binding to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iclassactivator">IClassActivator</a> interface. This allows <b>IClassActivator</b> to provide access to the class object and instances of the class.
 * 
 * To use class monikers, you must use the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-createclassmoniker">CreateClassMoniker</a> function to create these monikers.
 * 
 * 
 * <h3><a id="File_Moniker_Implementation"></a><a id="file_moniker_implementation"></a><a id="FILE_MONIKER_IMPLEMENTATION"></a>File Moniker Implementation</h3>
 * File monikers are monikers that represent a path in the file system; a file moniker can identify any object that is saved in its own file. To identify objects contained within a file, you can compose monikers of other classes (for example, item monikers) to the right of a file moniker. However, the moniker to the left of a file moniker within a composite must be another file moniker, an anti-moniker, or a class moniker. It is illegal, for example, for an item moniker to appear to the left of a file moniker in a composite. 
 * 
 * 
 * 
 * Note that an anti-moniker is the inverse of an entire file moniker, not the inverse of a component of the path that the moniker represents; that is, when you compose an anti-moniker to the right of a file moniker, the entire file moniker is removed. If you want to remove just the rightmost component of the path represented by a file moniker, you must create a separate file moniker based on the ".." path and then compose that to the end of the file moniker.
 * 
 * A moniker client (using a moniker to get an interface pointer to an object) does not typically need to know the class of the moniker; it can simply call methods using an <b>IMoniker</b> interface pointer.
 * 
 * A moniker provider (handing out monikers that identify its objects to make them accessible to moniker clients) must use file monikers if the objects they are identifying are stored in files. If each object resides in its own file, file monikers are the only type needed. If the objects identified are smaller than a file, you need to use another type of moniker (for example, item monikers) in addition to file monikers.
 * 
 * To use file monikers, you must use the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-createfilemoniker">CreateFileMoniker</a> function to create the monikers. To allow your objects to be loaded when a file moniker is bound, your objects must implement the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersistfile">IPersistFile</a> interface.
 * 
 * The most common example of moniker providers are COM server applications that support linking. If your COM server application supports linking only to file-based documents in their entirety, file monikers are the only type of moniker you need. If your COM server application supports linking to objects smaller than a document (such as sections of a document or embedded objects), you must use item monikers as well as file monikers.
 * 
 * <h3><a id="Generic_Composite_Moniker_Implementation"></a><a id="generic_composite_moniker_implementation"></a><a id="GENERIC_COMPOSITE_MONIKER_IMPLEMENTATION"></a>Generic Composite Moniker Implementation</h3>
 * A generic composite moniker is a composite moniker whose components have no special knowledge of each other.
 * 
 * Composition is the process of joining two monikers together. Sometimes two monikers of specific classes can be combined in a special manner; for example, a file moniker representing an incomplete path and another file moniker representing a relative path can be combined to form a single file moniker representing the complete path. This is an example of nongeneric composition. Generic composition, on the other hand, can connect any two monikers, no matter what their classes. Because a nongeneric composition depends on the class of the monikers involved, it can be performed only by a particular class's implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-composewith">IMoniker::ComposeWith</a> method. You can define new types of nongeneric compositions if you write a new moniker class. By contrast, generic compositions are performed by the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-creategenericcomposite">CreateGenericComposite</a> function.
 * 
 * A moniker client (using a moniker to get an interface pointer to an object) does not typically need to know the class of the moniker, or whether it is a generic composite or a nongeneric composite; it can simply call methods using an <b>IMoniker</b> interface pointer.
 * 
 * A moniker provider (handing out monikers that identify its objects to make them accessible to moniker clients) may need to compose two monikers together. (For example, if you are using an item moniker to identify an object, you must compose it with the moniker identifying the object's container before you hand it out.) Use the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-composewith">IMoniker::ComposeWith</a> method to do this, calling the method on the first moniker and passing the second moniker as a parameter; this method may produce either a generic or a nongeneric composite.
 * 
 * The only time you should explicitly create a generic composite moniker is when you are writing your own moniker class. In your implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-composewith">IMoniker::ComposeWith</a>, you should attempt to perform a nongeneric composition whenever possible; if you cannot perform a nongeneric composition and generic composition is acceptable, you can call the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-creategenericcomposite">CreateGenericComposite</a> function to create a generic composite moniker.
 * 
 * <h3><a id="Item_Moniker_Implementation"></a><a id="item_moniker_implementation"></a><a id="ITEM_MONIKER_IMPLEMENTATION"></a>Item Moniker Implementation</h3>
 * Item monikers are used to identify objects within containers, such as a portion of a document, an embedded object within a compound document, or a range of cells within a spreadsheet. Item monikers are often used in combination with file monikers; a file moniker is used to identify the container while an item moniker is used to identify the item within the container.
 * 
 * An item moniker contains a text string; this string is used by the container object to distinguish the contained item from the others. The container object must implement the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleitemcontainer">IOleItemContainer</a> interface; this interface enables the item moniker code to acquire a pointer to an object, given only the string that identifies the object.
 * 
 * A moniker client (using a moniker to get an interface pointer to an object) does not typically need to know the class of the moniker; it simply call methods using an <b>IMoniker</b> interface pointer.
 * 
 * A moniker provider (handing out monikers that identify its objects to make them accessible to moniker clients) must use item monikers if the objects identified are contained within another object and can be individually identified using a string. Use another type of moniker (for example, file monikers) to identify the container object.
 * 
 * To use item monikers, you must use the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-createitemmoniker">CreateItemMoniker</a> function to create the monikers. To allow your objects to be loaded when an item moniker is bound, the container of your objects must implement the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleitemcontainer">IOleItemContainer</a> interface.
 * 
 * The most common example of moniker providers are COM applications that support linking. If your COM application supports linking to objects smaller than a file-based document, you need to use item monikers. For a server application that allows linking to a selection within a document, you use the item monikers to identify those objects. For a container application that allows linking to embedded objects, you use the item monikers to identify the embedded objects.
 * 
 * <h3><a id="OBJREF_Moniker_Implementation"></a><a id="objref_moniker_implementation"></a><a id="OBJREF_MONIKER_IMPLEMENTATION"></a>OBJREF Moniker Implementation</h3>
 * OBJREF monikers represent a reference to an object instance that is running on an out-of-process server, either locally or remotely. The moniker identifies the object instance and the computer the object is running on.
 * 
 * An OBJREF moniker is similar in many ways to a pointer moniker, except that the running object is out-of-process. A client can call <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-bindtoobject">IMoniker::BindToObject</a> on an OBJREF moniker and use the pointer it obtains to access the running object, regardless of its location.
 * 
 * An important distinction from a pointer moniker is that the display name of an OBJREF moniker can be embedded in an HTML page, and the running object represented by the moniker can be bound by a client script, applet, or ActiveX control.
 * 
 * The primary use for an OBJREF moniker is to obtain access to a running object instance over the Internet. An active server page or some other means of generating dynamic HTML content places the display name of an OBJREF moniker in a parameter to an applet or an ActiveX control. The code of the applet or control calls the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-createobjrefmoniker">CreateObjrefMoniker</a> function to create an OBJREF moniker based on the display name, and it then calls <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-bindtoobject">IMoniker::BindToObject</a> on the resulting OBJREF moniker to get access to the 
 * running object instance. The active server page then marshals a pointer to the running object back to the page's client.
 * 
 * <h3><a id="Pointer_Moniker_Implementation"></a><a id="pointer_moniker_implementation"></a><a id="POINTER_MONIKER_IMPLEMENTATION"></a>Pointer Moniker Implementation</h3>
 * A pointer moniker essentially wraps an interface pointer so that it looks like a moniker and can be passed to those interfaces that require monikers. Binding a pointer moniker is done by calling the pointer's <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method.
 * 
 * Instances of pointer monikers refuse to be serialized; that is, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststream-save">IPersistStream::Save</a> will return an error. These monikers can, however, be marshaled to a different process in an RPC call; internally, the system marshals and unmarshals the pointer by using the standard paradigm for marshaling interface pointers.
 * 
 * 
 * 
 * 
 * 
 * Pointer monikers are rarely needed. Use pointer monikers only if you need monikers to identify objects that have no persistent representation. Pointer monikers allow such objects to participate in a moniker-binding operation.
 * 
 * <h3><a id="URL_Moniker_Implementation"></a><a id="url_moniker_implementation"></a><a id="URL_MONIKER_IMPLEMENTATION"></a>URL Moniker Implementation</h3>
 * The URL moniker implementation of <b>IMoniker</b> is found on a URL moniker object, which also supports <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> and the <a href="https://docs.microsoft.com/previous-versions/ms775081(v=vs.85)">IAsyncMoniker</a> interface. The <b>IMoniker</b> interface inherits its definition from <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersiststream">IPersistStream</a> as well as <b>IUnknown</b>, and <b>IPersistStream</b> inherits from <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersist">IPersist</a>. Therefore, the <b>IMoniker</b> implementation includes support for <b>IPersistStream</b> and <b>IPersist</b>.
 * 
 * 
 * 
 * The <a href="https://docs.microsoft.com/previous-versions/ms775081(v=vs.85)">IAsyncMoniker</a> interface is simply <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>. (There are no additional methods.) It is is used to allow clients to determine whether a moniker supports asynchronous binding.
 * 
 * To get a pointer to the <b>IMoniker</b> interface on this object, call the <b>CreateURLMonikerEx</b> function.
 * 
 * A moniker client (using a moniker to get an interface pointer to an object) does not typically need to know the class of the moniker it is using; it simply calls methods using an <b>IMoniker</b> interface pointer.
 * 
 * A moniker provider (handing out monikers that identify its objects to make them accessible to moniker clients) must use item monikers if the objects it identifies are contained within another object and can be individually identified using a string. It will also need to use another type of moniker (for example, file monikers) to identify the container object.
 * 
 * To use item monikers, you must use the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-createitemmoniker">CreateItemMoniker</a> function to create the monikers. To allow your objects to be loaded when an item moniker is bound, the container of
 * your objects must implement the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleitemcontainer">IOleItemContainer</a> interface.
 * 
 * The most common example of moniker providers are COM applications that support linking. If your COM application supports linking to objects smaller than a file-based documents, you need to use item monikers. For a server application that allows linking to a selection within a document, you use the item monikers to identify those objects. For a container application that allows linking to embedded objects, you use the item monikers to identify the embedded objects.
 * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nn-objidl-imoniker
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IMoniker extends IPersistStream{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMoniker
     * @type {Guid}
     */
    static IID => Guid("{0000000f-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BindToObject", "BindToStorage", "Reduce", "ComposeWith", "Enum", "IsEqual", "Hash", "IsRunning", "GetTimeOfLastChange", "Inverse", "CommonPrefixWith", "RelativePathTo", "GetDisplayName", "ParseDisplayName", "IsSystemMoniker"]

    /**
     * Binds to the specified object. The binding process involves finding the object, putting it into the running state if necessary, and providing the caller with a pointer to a specified interface on the identified object.
     * @remarks
     * <b>BindToObject</b> implements the primary function of a moniker, which is to locate the object identified by the moniker and return a pointer to one of its interfaces.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * If you are using a moniker as a persistent connection between two objects, you activate the connection by calling <b>BindToObject</b>.
     * 
     * You typically call <b>BindToObject</b> during the following process: 
     * 
     * <ol>
     * <li>Create a bind context object with a call to the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-createbindctx">CreateBindCtx</a> function.</li>
     * <li>Call <b>BindToObject</b> using the moniker, retrieving a pointer to a desired interface on the identified object.</li>
     * <li>Release the bind context.</li>
     * <li>Through the acquired interface pointer, perform the desired operations on the object.</li>
     * <li>When finished with the object, release the object's interface pointer. </li>
     * </ol>
     * The following code fragment illustrates these steps.
     * 
     * 
     * ``` syntax
     * HRESULT hr;       // An error code
     * IMoniker * pMnk;  // A previously acquired interface moniker
     * 
     * // Obtain an IBindCtx interface.
     * IBindCtx * pbc; 
     * hr = CreateBindCtx(NULL, &amp;pbc); 
     * if (FAILED(hr)) exit(0);  // Handle errors here. 
     *    
     * // Obtain an implementation of pCellRange. 
     * ICellRange * pCellRange; 
     * hr = pMnk-&gt;BindToObject(pbc, NULL, IID_ICellRange, &amp;pCellRange); 
     * if (FAILED(hr)) exit(0);  // Handle errors here. 
     * 
     * // Use pCellRange here. 
     * 
     * // Release interfaces after use. 
     * pbc-&gt;Release(); 
     * pCellRange-&gt;Release(); 
     * 
     * ```
     * 
     * You can also use the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-bindmoniker">BindMoniker</a> function when you intend only one binding operation and don't need to retain the bind context object. This helper function encapsulates the creation of the bind context, calling <b>BindToObject</b> and releasing the bind context.
     * 
     * COM containers that support links to objects use monikers to locate and get access to the linked object but typically do not call <b>BindToObject</b> directly. Instead, when a user activates a link in a container, the link container usually calls <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-doverb">IOleObject::DoVerb</a>, using the link handler's implementation, which calls <b>BindToObject</b> on the moniker stored in the linked object (if it cannot handle the verb).
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * What your implementation does depends on whether you expect your moniker to have a prefix; that is, whether you expect the <i>pmkToLeft</i> parameter to be <b>NULL</b> or not. For example, an item moniker, which identifies an object within a container, expects that <i>pmkToLeft</i> identifies the container. An item moniker consequently uses <i>pmkToLeft</i> to request services from that container. If you expect your moniker to have a prefix, you should use the <i>pmkToLeft</i> parameter (for example, calling <b>BindToObject</b> on it) to request services from the object it identifies.
     * 
     * If you expect your moniker to have no prefix, your <b>BindToObject</b> implementation should first check the running object table (ROT) to see whether the object is already running. To acquire a pointer to the ROT, your implementation should call <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ibindctx-getrunningobjecttable">IBindCtx::GetRunningObjectTable</a> on the <i>pbc</i> parameter. You can then call the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-irunningobjecttable-getobject">IRunningObjectTable::GetObject</a> method to see if the current moniker has been registered in the ROT. If so, you can immediately call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> to get a pointer to the interface requested by the caller. 
     * 
     * 
     * 
     * When your <b>BindToObject</b> implementation binds to some object, it should use the <i>pbc</i> parameter to call <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ibindctx-registerobjectbound">IBindCtx::RegisterObjectBound</a> to store a reference to the bound object in the bind context. This ensures that the bound object remains running until the bind context is released, which can avoid the expense of having a subsequent binding operation load it again later.
     * 
     * If the bind context's <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-bind_opts">BIND_OPTS</a> structure specifies the BINDFLAGS_JUSTTESTEXISTENCE flag, your implementation has the option of returning <b>NULL</b> in <i>ppvResult</i> (although you can also ignore the flag and perform the complete binding operation).
     * 
     * <h3><a id="Implementation-specific_Notes"></a><a id="implementation-specific_notes"></a><a id="IMPLEMENTATION-SPECIFIC_NOTES"></a>Implementation-specific Notes</h3>
     * <table>
     * <tr>
     * <th>Implementation</th>
     * <th>Notes</th>
     * </tr>
     * <tr>
     * <td>Anti-moniker</td>
     * <td>
     * This method is not implemented. It returns E_NOTIMPL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>Class moniker</td>
     * <td>
     * If <i>pmkLeft</i> is <b>NULL</b>, calls <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cogetclassobject">CoGetClassObject</a>, using the CLSID the class moniker was initialized with (in <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-createclassmoniker">CreateClassMoniker</a> or through <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-mkparsedisplayname">MkParseDisplayName</a>) and the <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-clsctx">CLSCTX</a> of the current <i>pbc</i> (<a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a>).
     * 
     * If <i>pmkLeft</i> is non-<b>NULL</b>, calls pmkLeft-&gt;BindToObject for <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iclassactivator">IClassActivator</a> and calls <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iclassactivator-getclassobject">IClassActivator::GetClassObject</a> with the CLSID it was initialized with and the <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-clsctx">CLSCTX</a> and locale parameters of the current <i>pbc</i> (<a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a>).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>File moniker</td>
     * <td>
     * When <i>pmkToLeft</i> is <b>NULL</b>, the method looks for the moniker in the ROT and, if found, queries the retrieved object for the requested interface pointer. If the moniker is not found in the ROT, the method loads the object from the file system and retrieves the requested interface pointer.
     * 
     * If <i>pmkLeft</i> is not <b>NULL</b>, instead of determining the class to instantiate and initialize with the contents of the file referred to by the file moniker using <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-getclassfile">GetClassFile</a> (or other means), call pmkLeft-&gt;BindToObject for <a href="https://docs.microsoft.com/windows/desktop/api/unknwnbase/nn-unknwnbase-iclassfactory">IClassFactory</a> and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iclassactivator">IClassActivator</a>, retrieve this pointer in <i>pcf</i>. If this fails with E_NOINTERFACE, return MK_E_INTERMEDIATEINTERFACENOTSUPPORTED.
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/unknwnbase/nn-unknwnbase-iclassfactory">IClassFactory</a> pointer is successfully retrieved, call pcf-&gt;CreateInstance(IID_IPersistFile, (void**)&amp;ppf) to get a fresh instance of the class to be initialized and initialize it by using <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersistfile">IPersistFile</a> or other appropriate means per the existing initialization paths of file moniker.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>Generic composite moniker</td>
     * <td>
     * If <i>pmkToLeft</i> is <b>NULL</b>, this method looks for the moniker in the ROT and, if found, queries the retrieved object for the requested interface pointer. If <i>pmkToLeft</i> is not <b>NULL</b>, the method recursively calls <b>BindToObject</b> on the rightmost component of the composite, passing the rest of the composite as the <i>pmkToLeft</i> parameter for that call.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>Item moniker</td>
     * <td>
     * If <i>pmkToLeft</i> is <b>NULL</b>, this method returns E_INVALIDARG. Otherwise, the method calls <b>BindToObject</b> on the <i>pmkToLeft</i> parameter, requesting an <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleitemcontainer">IOleItemContainer</a> interface pointer. The method then calls <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleitemcontainer-getobject">IOleItemContainer::GetObject</a>, passing the string contained within the moniker, and returns the requested interface pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>OBJREF moniker</td>
     * <td>
     * The <i>pmkToLeft</i> parameter must be <b>NULL</b>. Because the OBJREF moniker represents a running object, no activation takes place. If the represented object is no longer running, <b>BindToObject</b> fails with E_UNEXPECTED.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>Pointer moniker</td>
     * <td>
     * This method queries the wrapped pointer for the requested interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>URL moniker</td>
     * <td>
     * Because the URL Moniker supports asynchronous binding, the actual return value of its <b>BindToObject</b> may vary depending on the object parameters established in the bind context. For more information, see below.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The semantics of the bind operation for a URL moniker are identical regardless of synchronous or asynchronous usage, and are as follows:
     * 
     * <ol>
     * <li>The URL moniker pulls further information for the bind operation from the bind context. For example, the moniker can obtain pointers to the <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775060(v=vs.85)">IBindStatusCallback</a> and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumformatetc">IEnumFORMATETC</a> interfaces that are registered in the bind context. Further information can include additional bind options specified on the bind context through <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ibindctx-setbindoptions">IBindCtx::SetBindOptions</a>, such as the <i>dwTickCountDeadline</i> parameter or the <i>grfFlags</i> value of BIND_MAYBOTHERUSER.</li>
     * <li>
     * Next the moniker checks the ROT of the bind context to determine whether the referenced object is already running. The moniker can obtain this information with the following calls:
     * 
     * 
     * ``` syntax
     * IBindCtx::GetRunningObjectTable(&amp;prot)
     * prot-&gt;IsRunning(this)
     * 
     * ```
     * 
     * </li>
     * <li>
     * If the object is already running, the moniker retrieves the running object with the following call:
     * 
     * 
     * ``` syntax
     * prot-&gt;GetObject(this, &amp;punk)
     * 
     * ```
     * 
     * </li>
     * <li>
     * Then the moniker calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> for the requested interface.
     * 
     * </li>
     * <li>
     * Otherwise, the moniker queries the client by calling <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775058(v=vs.85)">IBindStatusCallback::GetBindInfo</a> to obtain additional bind information. The moniker then initiates the bind operation and passes the resulting IBinding interface back to the client by calling <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775065(v=vs.85)">IBindStatusCallback::OnStartBinding</a>.
     * 
     * </li>
     * <li>
     * If in step 1 it was determined that this was an asynchronous bind, <b>BindToObject</b> returns MK_S_ASYNCHRONOUS at this point with <b>NULL</b> in <i>ppv</i>. The caller will receive the actual object pointer during the <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775063(v=vs.85)">IBindStatusCallback::OnObjectAvailable</a> method at some later point. The following steps then occur asynchronously to the caller, typically on another thread of execution.
     * 
     * </li>
     * <li>
     * The class of the resource designated by the URL Moniker is determined in one of the following ways:
     * 
     * 
     * <ul>
     * <li>
     * The URL moniker examines the media type of the data. If the media type is application/x-oleobject, the first 16-bytes of the actual data (Content-Body) contain the CLSID of the resource and subsequent data is to be interpreted by the class itself. For all other media types, URL Moniker looks in the system registry for the HKEY_CLASSES_ROOT\MIME\Database\Content-Type\&lt;media-type&gt;\CLSID key. Note that application/x-oleobject will be used until application/oleobject is approved.
     * 
     * </li>
     * <li>
     * The URL moniker matches portions of arriving data to patterns registered in the system registry under HKEY_CLASSES_ROOT\FileTypes.
     * 
     * </li>
     * <li>
     * Finally, if all else fails, the URL Moniker correlates the trailing extension of the resource, if any, to a CLSID using the HKEY_CLASSES_ROOT\.??? keys in the system registry, as is done by GetClassFile and the shell.
     * 
     * </li>
     * </ul>
     * </li>
     * <li>
     * Having determined the class, the URL moniker creates an instance using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> of CLSCTX_SERVER asking for the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface.
     * 
     * 
     * </li>
     * <li>
     * The URL moniker next calls the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method of the newly created object for the <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775042(v=vs.85)">IPersistMoniker</a> interface. If <b>QueryInterface</b> is successful, the URL moniker calls <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775044(v=vs.85)">IPersistMoniker::Load</a> passing itself (this) as the moniker parameter. The object typically calls <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-bindtostorage">BindToStorage</a> asking for the storage interface that they are interested in.
     * 
     * </li>
     * <li>
     * Otherwise, the URL moniker calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> for <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersiststream">IPersistStream</a> and, if successful, calls <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststream-load">IPersistStream::Load</a>, passing the object an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> pointer for a stream object that is being filled asynchronously by the transport.
     * 
     * If the class being called is not marked with the category CATID_AsyncAware, calls to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-isequentialstream-read">ISequentialStream::Read</a> or <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-isequentialstream-write">ISequentialStream::Write</a> that reference data not yet available block until the data becomes available. These calls block in the traditional COM sense. A message loop is entered which allows certain messages to be processed, and the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imessagefilter">IMessageFilter</a> of the thread is called appropriately.
     * 
     * If the class is marked with the category CATID_AsyncAware, calls to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-isequentialstream-read">ISequentialStream::Read</a> or <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-isequentialstream-write">ISequentialStream::Write</a> that reference data not yet available return E_PENDING.
     * 
     * </li>
     * <li>
     * Otherwise, the URL moniker calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> for <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersistfile">IPersistFile</a> and, if successful, completes the download into a temporary file. On completion, the URL moniker calls <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersistfile-load">IPersistFile::Load</a>. The created file is cached along with other Internet downloaded data. The client must be sure not to delete this file.
     * 
     * </li>
     * <li>
     * When the object returns from one of the various <b>Load</b> calls described in the previous steps, the URL moniker calls the <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775063(v=vs.85)">IBindStatusCallback::OnObjectAvailable</a> method to return the interface pointer that the client originally requested when the client called <b>BindToObject</b>.
     * 
     * 
     * </li>
     * </ol>
     * @param {IBindCtx} pbc A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> interface on the bind context object, which is used in this binding operation. The bind context caches objects bound during the binding process, contains parameters that apply to all operations using the bind context, and provides the means by which the moniker implementation should retrieve information about its environment.
     * @param {IMoniker} pmkToLeft If the moniker is part of a composite moniker, pointer to the moniker to the left of this moniker. This parameter is primarily used by moniker implementers to enable cooperation between the various components of a composite moniker. Moniker clients should use <b>NULL</b>.
     * @param {Pointer<Guid>} riidResult The IID of the interface the client wishes to use to communicate with the object that the moniker identifies.
     * @returns {Pointer<Pointer<Void>>} The address of pointer variable that receives the interface pointer requested in <i>riid</i>. Upon successful return, *<i>ppvResult</i> contains the requested interface pointer to the object the moniker identifies. When successful, the implementation must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the moniker. It is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. If an error occurs, *<i>ppvResult</i> should be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-imoniker-bindtoobject
     */
    BindToObject(pbc, pmkToLeft, riidResult) {
        result := ComCall(8, this, "ptr", pbc, "ptr", pmkToLeft, "ptr", riidResult, "ptr*", &ppvResult := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppvResult
    }

    /**
     * Binds to the storage for the specified object. Unlike the IMoniker::BindToObject method, this method does not activate the object identified by the moniker.
     * @remarks
     * There is an important difference between the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-bindtoobject">BindToObject</a> and <b>BindToStorage</b> methods. If, for example, you have a moniker that identifies a spreadsheet object, calling <b>BindToObject</b> provides access to the spreadsheet object itself, while calling <b>BindToStorage</b> provides access to the storage object in which the spreadsheet resides. 
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Although none of the COM moniker classes call this method in their binding operations, it might be appropriate to call it in the implementation of a new moniker class. You could call this method in an implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-bindtoobject">BindToObject</a> that requires information from the object identified by the <i>pmkToLeft</i> parameter and can get it from the persistent storage of the object without activation. For example, if your monikers are used to identify objects that can be activated without activating their containers, you may find this method useful.
     * 
     * A client that can read the storage of the object its moniker identifies could also call this method.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Your implementation should locate the persistent storage for the object identified by the current moniker and return the desired interface pointer. Some types of monikers represent pseudo-objects, which are objects that do not have their own persistent storage. Such objects comprise some portion of the internal state of its container, for example, a range of cells in a spreadsheet. If your moniker class identifies this type of object, your implementation of <b>BindToStorage</b> should return the error MK_E_NOSTORAGE.
     * 
     * If the bind context's <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-bind_opts">BIND_OPTS</a> structure specifies the BINDFLAGS_JUSTTESTEXISTENCE flag, your implementation has the option of returning <b>NULL</b> in <i>ppvObj</i> (although you can also ignore the flag and perform the complete binding operation).
     * 
     * <h3><a id="Implementation-specific_Notes"></a><a id="implementation-specific_notes"></a><a id="IMPLEMENTATION-SPECIFIC_NOTES"></a>Implementation-specific Notes</h3>
     * <table>
     * <tr>
     * <th>Implementation</th>
     * <th>Notes</th>
     * </tr>
     * <tr>
     * <td>Anti-moniker</td>
     * <td>
     * This method returns E_NOTIMPL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>Class moniker</td>
     * <td>
     * This method forwards to the class moniker's <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-bindtoobject">BindToObject</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>File moniker</td>
     * <td>
     * This method opens the file specified by the path represented by the moniker and returns an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> pointer to that file. The method supports binding to the <b>IStorage</b> interface only; if <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> or <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ilockbytes">ILockBytes</a> is requested in <i>riid</i>, the method returns E_UNSPEC, and if other interfaces are requested, this method returns E_NOINTERFACE. Unless <i>pmkToLeft</i> is a class moniker, <i>pmkToLeft</i> should be <b>NULL</b>, as in the implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-bindtoobject">IMoniker::BindToObject</a>. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>Generic composite moniker</td>
     * <td>
     * This method recursively calls <b>BindToStorage</b> on the rightmost component of the composite, passing the rest of the composite as the <i>pmkToLeft</i> parameter for that call. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>Item moniker</td>
     * <td>
     * If <i>pmkToLeft</i> is <b>NULL</b>, this method returns E_INVALIDARG. Otherwise, the method calls <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-bindtoobject">IMoniker::BindToObject</a> on the <i>pmkToLeft</i> parameter, requesting an <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleitemcontainer">IOleItemContainer</a> interface pointer. The method then calls <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleitemcontainer-getobjectstorage">IOleItemContainer::GetObjectStorage</a> for the requested interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>OBJREF moniker</td>
     * <td>
     * This method obtains a marshaled pointer to the requested interface on the storage that contains the running object. Because the OBJREF moniker represents a running object, no activation takes place. If the represented object is no longer running, <b>BindToStorage</b> fails with E_UNEXPECTED. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>Pointer moniker</td>
     * <td>
     * This method queries the wrapped pointer for the requested interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>URL moniker</td>
     * <td>
     * The system implementation of URL monikers supports <b>BindToStorage</b> for stream objects on all URLs and for storage objects in the case where the designated resource is a compound file.
     * 
     * Because the URL moniker supports asynchronous binding, the actual return value of its <b>BindToStorage</b> may vary depending on the object parameters established in the bind context. However, the semantics of the bind operation are identical regardless of synchronous or asynchronous usage, as follows:
     * 
     * <ul>
     * <li>
     * The URL moniker pulls further information for the bind operation from the bind context. For example, the moniker can obtain pointers to the <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775060(v=vs.85)">IBindStatusCallback</a> and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumformatetc">IEnumFORMATETC</a> interfaces that are registered in the bind context. Further information can include additional bind options specified on the bind context through <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ibindctx-setbindoptions">IBindCtx::SetBindOptions</a>, such as the <i>dwTickCountDeadline</i> parameter or the <i>grfFlags</i> value of BIND_MAYBOTHERUSER. The moniker then queries the client by calling <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775058(v=vs.85)">IBindStatusCallback::GetBindInfo</a> and initiates the bind operation with the transport and passes the resulting IBinding to the client by calling <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775065(v=vs.85)">IBindStatusCallback::OnStartBinding</a>.
     * 
     * </li>
     * <li>
     * If the caller requested an asynchronous <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> or <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> by specifying the BINDF_ASYNCSTORAGE flag in the <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms774966(v=vs.85)">BINDINFO</a> structure retrieved from the <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775058(v=vs.85)">IBindStatusCallback::GetBindInfo</a>, method the URL moniker returns the object as soon as possible. Calls to these <b>IStorage</b> or <b>IStream</b> objects that reference data not yet available return E_PENDING.
     * 
     * </li>
     * <li>
     * If the caller does not specify asynchronous <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> or <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a> as described above, the URL moniker will still return an object through the <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775061(v=vs.85)">IBindStatusCallback::OnDataAvailable</a> method as soon as possible. However, calls to these objects that reference data not yet available will block until the data becomes available. For some applications, this will require the least modification of their existing I/O code yet may still result in improved performance depending on their access patterns.
     * 
     * </li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @param {IBindCtx} pbc A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> interface on the bind context object, which is used in this binding operation. The bind context caches objects bound during the binding process, contains parameters that apply to all operations using the bind context, and provides the means by which the moniker implementation should retrieve information about its environment.
     * @param {IMoniker} pmkToLeft If the moniker is part of a composite moniker, pointer to the moniker to the left of this moniker. This parameter is primarily used by moniker implementers to enable cooperation between the various components of a composite moniker. Moniker clients should use <b>NULL</b>.
     * @param {Pointer<Guid>} riid A reference to the identifier of the storage interface requested, whose pointer will be returned in <i>ppvObj</i>. Storage interfaces commonly requested include <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a>, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ilockbytes">ILockBytes</a>.
     * @returns {Pointer<Pointer<Void>>} The address of pointer variable that receives the interface pointer requested in <i>riid</i>. Upon successful return, *<i>ppvObj</i> contains the requested interface pointer to the storage of the object the moniker identifies. When successful, the implementation must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the storage. It is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. If an error occurs, *<i>ppvObj</i> should be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-imoniker-bindtostorage
     */
    BindToStorage(pbc, pmkToLeft, riid) {
        result := ComCall(9, this, "ptr", pbc, "ptr", pmkToLeft, "ptr", riid, "ptr*", &ppvObj := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppvObj
    }

    /**
     * Reduces a moniker to its simplest form.
     * @remarks
     * This method is intended for the following uses:
     * 
     * <ul>
     * <li>
     * Enable the construction of user-defined macros or aliases as new kinds of moniker classes. When reduced, the moniker to which the macro evaluates is returned.
     * 
     * </li>
     * <li>
     * Enable the construction of a kind of moniker that tracks data as it moves about. When reduced, the moniker of the data in its current location is returned.
     * 
     * </li>
     * <li>
     * On file systems that support an identifier-based method of accessing files that is independent of filenames; a file moniker could be reduced to a moniker which contains one of these identifiers.
     * 
     * </li>
     * </ul>
     * The intent of the <a href="https://docs.microsoft.com/windows/win32/api/objidl/ne-objidl-mkrreduce">MKRREDUCE</a> flags passed in the <i>dwReduceHowFar</i> parameter is to provide the ability to programmatically reduce a moniker to a form whose display name is recognizable to the user. For example, paths in the file system, bookmarks in word-processing documents, and range names in spreadsheets are all recognizable to users. In contrast, a macro or an alias encapsulated in a moniker are not recognizable to users.
     * 
     * 
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * The scenarios described above are not currently implemented by the system-supplied moniker classes.
     * 
     * You should call <b>Reduce</b> before comparing two monikers using the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-isequal">IMoniker::IsEqual</a> method because a reduced moniker is in its most specific form. <b>IsEqual</b> may return S_FALSE on two monikers before they are reduced and return S_OK after they are reduced.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * If the current moniker can be reduced, your implementation must not reduce the moniker in-place. Instead, it must return a new moniker that represents the reduced state of the current one. This way, the caller still has the option of using the nonreduced moniker (for example, enumerating its components). Your implementation should reduce the moniker at least as far as is requested.
     * 
     * <h3><a id="Implementation-specific_Notes"></a><a id="implementation-specific_notes"></a><a id="IMPLEMENTATION-SPECIFIC_NOTES"></a>Implementation-specific Notes</h3>
     * <table>
     * <tr>
     * <th>Implementation</th>
     * <th>Notes</th>
     * </tr>
     * <tr>
     * <td>Anti-moniker</td>
     * <td>This method returns MK_S_REDUCED_TO_SELF and passes back the same moniker.</td>
     * </tr>
     * <tr>
     * <td>Class moniker</td>
     * <td>This method returns MK_S_REDUCED_TO_SELF and passes back the same moniker.</td>
     * </tr>
     * <tr>
     * <td>File moniker</td>
     * <td>This method returns MK_S_REDUCED_TO_SELF and passes back the same moniker.</td>
     * </tr>
     * <tr>
     * <td>Generic composite moniker</td>
     * <td>This method recursively calls <b>Reduce</b> for each of its component monikers. If any of the components reduces itself, the method returns S_OK and passes back a composite of the reduced components. If no reduction occurred, the method passes back the same moniker and returns MK_S_REDUCED_TO_SELF.</td>
     * </tr>
     * <tr>
     * <td>Item moniker</td>
     * <td>This method returns MK_S_REDUCED_TO_SELF and passes back the same moniker.</td>
     * </tr>
     * <tr>
     * <td>OBJREF moniker</td>
     * <td>This method returns MK_S_REDUCED_TO_SELF and passes back the same moniker.</td>
     * </tr>
     * <tr>
     * <td>Pointer moniker</td>
     * <td>This method returns MK_S_REDUCED_TO_SELF and passes back the same moniker.</td>
     * </tr>
     * <tr>
     * <td>URL moniker</td>
     * <td>This method returns MK_S_REDUCED_TO_SELF and passes back the same moniker.</td>
     * </tr>
     * </table>
     * @param {IBindCtx} pbc A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> interface on the bind context to be used in this binding operation. The bind context caches objects bound during the binding process, contains parameters that apply to all operations using the bind context, and provides the means by which the moniker implementation should retrieve information about its environment.
     * @param {Integer} dwReduceHowFar Specifies how far this moniker should be reduced. This parameter must be one of the values from the <a href="https://docs.microsoft.com/windows/win32/api/objidl/ne-objidl-mkrreduce">MKRREDUCE</a> enumeration.
     * @param {Pointer<IMoniker>} ppmkToLeft On entry, a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> pointer variable that contains the interface pointer to moniker to the left of this moniker. This parameter is used primarily by moniker implementers to enable cooperation between the various components of a composite moniker; moniker clients can usually pass <b>NULL</b>.
     * 
     * On return, *<i>ppmkToLeft</i> is usually set to <b>NULL</b>, indicating no change in the original moniker to the left. In rare situations, *<i>ppmkToLeft</i> indicates a moniker, indicating that the previous moniker to the left should be disregarded and the moniker returned through *<i>ppmkToLeft</i> is the replacement. In such a situation, the implementation must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the old moniker to the left of this moniker and must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the new returned moniker; the caller must release it later. If an error occurs, the implementation can either leave the interface pointer unchanged or set it to <b>NULL</b>.
     * @returns {IMoniker} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> pointer variable that receives the interface pointer to the reduced form of this moniker, which can be <b>NULL</b> if an error occurs or if this moniker is reduced to nothing. If this moniker cannot be reduced, *<i>ppmkReduced</i> is simply set to this moniker and the return value is MK_S_REDUCED_TO_SELF. If *<i>ppmkReduced</i> is non-<b>NULL</b>, the implementation must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the new moniker; it is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. (This is true even if *<i>ppmkReduced</i> is set to this moniker.)
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-imoniker-reduce
     */
    Reduce(pbc, dwReduceHowFar, ppmkToLeft) {
        result := ComCall(10, this, "ptr", pbc, "uint", dwReduceHowFar, "ptr*", ppmkToLeft, "ptr*", &ppmkReduced := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMoniker(ppmkReduced)
    }

    /**
     * Creates a new composite moniker by combining the current moniker with the specified moniker.
     * @remarks
     * Joining two monikers together is called <i>composition</i>. Sometimes two monikers of the same class can be combined in what is called nongeneric composition. For example, a file moniker representing an incomplete path and another file moniker representing a relative path can be combined to form a single file moniker representing the complete path. Nongeneric composition for a given moniker class can be handled only in the implementation of <b>ComposeWith</b> for that moniker class.
     * 
     * Combining two monikers of any class is called <i>generic composition</i>, which can be accomplished through a call to the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-creategenericcomposite">CreateGenericComposite</a> function.
     * 
     * Composition of monikers is an associative operation. That is, if A, B, and C are monikers, then, where Comp() represents the composition operation, Comp( Comp( A, B ), C )
     * 
     * is always equal to Comp( A, Comp( B, C ) ).
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * To combine two monikers, you should call <b>ComposeWith</b> rather than calling the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-creategenericcomposite">CreateGenericComposite</a> function to give the first moniker a chance to perform a nongeneric composition.
     * 
     * An object that provides item monikers to identify its objects would call <b>ComposeWith</b> to provide a moniker that completely identifies the location of the object. This would apply, for example, to a server that supports linking to portions of a document, or to a container that supports linking to embedded objects within its documents. In such a situation, you would do the following:
     * 
     * <ol>
     * <li>Create an item moniker that identifies the object.</li>
     * <li>Get a moniker that identifies the object's container.</li>
     * <li>Call <b>ComposeWith</b> on the moniker identifying the container, passing the item moniker as the <i>pmkRight</i> parameter.</li>
     * </ol>
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * You can use either nongeneric or generic composition to compose the current moniker with the moniker that pmkRight points to. If the class of the moniker indicated by <i>pmkRight</i> is the same as that of the current moniker, it is possible to use the contents of <i>pmkRight</i> to perform a more intelligent nongeneric composition.
     * 
     * In writing a new moniker class, you must decide if there are any kinds of monikers, whether of your own class or another class, to which you want to give special treatment. If so, implement <b>ComposeWith</b> to check whether <i>pmkRight</i> is a moniker of the type that should have this treatment. To do this, you can call the moniker's <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersist-getclassid">IPersist::GetClassID</a> method, or if you have defined a moniker object that supports a custom interface, you can call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on the moniker for that interface. An example of special treatment would be the nongeneric composition of an absolute file moniker with a relative file moniker. The most common case of a special moniker is the inverse for your moniker class (whatever you return from your implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-inverse">IMoniker::Inverse</a>).
     * 
     * If <i>pmkRight</i> completely negates the receiver so that the resulting composite is empty, you should pass back <b>NULL</b> in <i>ppmkComposite</i> and return the status code S_OK.
     * 
     * If the <i>pmkRight</i> parameter is not of a class to which you give special treatment, examine <i>fOnlyIfNotGeneric</i> to determine what to do next. If <i>fOnlyIfNotGeneric</i> is <b>TRUE</b>, pass back <b>NULL</b> through <i>ppmkComposite</i> and return the status code MK_E_NEEDGENERIC. If <i>fOnlyIfNotGeneric</i> is <b>FALSE</b>, call the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-creategenericcomposite">CreateGenericComposite</a> function to perform the composition generically.
     * 
     * <h3><a id="Implementation-specific_Notes"></a><a id="implementation-specific_notes"></a><a id="IMPLEMENTATION-SPECIFIC_NOTES"></a>Implementation-specific Notes</h3>
     * <table>
     * <tr>
     * <th>Implementation</th>
     * <th>Notes</th>
     * </tr>
     * <tr>
     * <td>Anti-moniker</td>
     * <td>If <i>fOnlyIfNotGeneric</i> is <b>TRUE</b>, this method sets <i>ppmkComposite</i> to <b>NULL</b> moniker and returns MK_E_NEEDGENERIC; otherwise, the method returns the result of combining the two monikers into a generic composite. Note that composing a file, item, or pointer moniker to the right of an anti-moniker produces a generic composite rather than composing to nothing, as would be the case if the order of composition were reversed. </td>
     * </tr>
     * <tr>
     * <td>Class moniker</td>
     * <td>Follows the contract and behaves like an item moniker in that it can return E_INVALIDARG and MK_E_NEEDGENERIC, and so forth.</td>
     * </tr>
     * <tr>
     * <td>File moniker</td>
     * <td>If <i>pmkRight</i> is an anti-moniker, the returned moniker is <b>NULL</b>. If <i>pmkRight</i> is a composite whose leftmost component is an anti-moniker, the returned moniker is the composite with the leftmost anti-moniker removed. If <i>pmkRight</i> is a file moniker, this method collapses the two monikers into a single file moniker, if possible. If not possible (for example, if both file monikers represent absolute paths, as in d:\work and e:\reports), the returned moniker is <b>NULL</b> and the return value is MK_E_SYNTAX. If <i>pmkRight</i> is neither an anti-moniker nor a file moniker, the method checks the <i>fOnlyIfNotGeneric</i> parameter; if it is <b>FALSE</b>, the method combines the two monikers into a generic composite; if it is <b>TRUE</b>, the method sets *<i>ppmkComposite</i> to <b>NULL</b> and returns MK_E_NEEDGENERIC.</td>
     * </tr>
     * <tr>
     * <td>Generic composite moniker</td>
     * <td>If <i>fOnlyIfNotGeneric</i> is <b>TRUE</b>, this method sets *<i>pmkComposite</i> to <b>NULL</b> and returns MK_E_NEEDGENERIC; otherwise, the method returns the result of combining the two monikers by calling the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-creategenericcomposite">CreateGenericComposite</a> function.</td>
     * </tr>
     * <tr>
     * <td>Item moniker</td>
     * <td>If <i>pmkRight</i> is an anti-moniker, the returned moniker is <b>NULL</b>. If <i>pmkRight</i> is a composite whose leftmost component is an anti-moniker, the returned moniker is the composite after the leftmost anti-moniker is removed. If <i>pmkRight</i> is not an anti-moniker, the method combines the two monikers into a generic composite if <i>fOnlyIfNotGeneric</i> is <b>FALSE</b>; if <i>fOnlyIfNotGeneric</i> is <b>TRUE</b>, the method returns a <b>NULL</b> moniker and a return value of MK_E_NEEDGENERIC.</td>
     * </tr>
     * <tr>
     * <td>OBJREF moniker</td>
     * <td>If <i>pmkRight</i> is an anti-moniker, the returned moniker is <b>NULL</b>. If <i>pmkRight</i> is a composite whose leftmost component is an anti-moniker, the returned moniker is the composite with the leftmost anti-moniker removed. If <i>pmkRight</i> is neither an anti-moniker nor a composite moniker whose leftmost component is an anti-moniker, the method checks the <i>fOnlyIfNotGeneric</i> parameter. If it is <b>FALSE</b>, the method combines the two monikers into a generic composite; if it is <b>TRUE</b>, the method sets *<i>ppmkComposite</i> to <b>NULL</b> and returns MK_E_NEEDGENERIC.</td>
     * </tr>
     * <tr>
     * <td>Pointer moniker</td>
     * <td>If <i>pmkRight</i> is an anti-moniker, the returned moniker is <b>NULL</b>. If <i>pmkRight</i> is a composite whose leftmost component is an anti-moniker, the returned moniker is the composite after the leftmost anti-moniker is removed. If <i>fOnlyIfNotGeneric</i> is <b>FALSE</b>, the returned moniker is a generic composite of the two monikers; otherwise, the method sets *<i>ppmkComposite</i> to <b>NULL</b> and returns MK_E_NEEDGENERIC.</td>
     * </tr>
     * <tr>
     * <td>URL moniker</td>
     * <td>URL monikers support composition of two URLs: a base URL composed with a relative URL. This composition is done according to the RFC on relative URLs. If <i>fOnlyIfNotGeneric</i> is <b>TRUE</b>, the method returns MK_E_NEEDGENERIC. Otherwise, this method simply returns <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-creategenericcomposite">CreateGenericComposite</a>(this, pmkRight, ppmkComposite). </td>
     * </tr>
     * </table>
     * @param {IMoniker} pmkRight A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface on the moniker to compose onto the end of this moniker.
     * @param {BOOL} fOnlyIfNotGeneric If <b>TRUE</b>, the caller requires a nongeneric composition, so the operation should proceed only if <i>pmkRight</i> is a moniker class that this moniker can compose with in some way other than forming a generic composite. If <b>FALSE</b>, the method can create a generic composite if necessary. Most callers should set this parameter to <b>FALSE</b>.
     * @returns {IMoniker} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> pointer variable that receives the composite moniker pointer. When successful, the implementation must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the resulting moniker; it is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. If an error occurs or if the monikers compose to nothing (for example, composing an anti-moniker with an item moniker or a file moniker), *<i>ppmkComposite</i> should be set to <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-imoniker-composewith
     */
    ComposeWith(pmkRight, fOnlyIfNotGeneric) {
        result := ComCall(11, this, "ptr", pmkRight, "int", fOnlyIfNotGeneric, "ptr*", &ppmkComposite := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMoniker(ppmkComposite)
    }

    /**
     * Retrieves a pointer to an enumerator for the components of a composite moniker.
     * @remarks
     * This method must supply an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienummoniker">IEnumMoniker</a> pointer to an enumerator that can enumerate the components of a moniker. For example, the implementation of the <b>IMoniker::Enum</b> method for a generic composite moniker creates an enumerator that can determine the individual monikers that make up the composite, while the <b>IMoniker::Enum</b> method for a file moniker creates an enumerator that returns monikers representing each of the components in the path.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Call this method to examine the components that make up a composite moniker.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * If the new moniker class has no discernible internal structure, your implementation of this method can simply return S_OK and set <i>ppenumMoniker</i> to <b>NULL</b>.
     * 
     * <h3><a id="Implementation-specific_Notes"></a><a id="implementation-specific_notes"></a><a id="IMPLEMENTATION-SPECIFIC_NOTES"></a>Implementation-specific Notes</h3>
     * <table>
     * <tr>
     * <th>Implementation</th>
     * <th>Notes</th>
     * </tr>
     * <tr>
     * <td>Anti-moniker</td>
     * <td>This method returns S_OK and sets <i>ppenumMoniker</i> to <b>NULL</b>.</td>
     * </tr>
     * <tr>
     * <td>Class moniker</td>
     * <td>This method returns S_OK and sets <i>ppenumMoniker</i> to <b>NULL</b>.</td>
     * </tr>
     * <tr>
     * <td>File moniker</td>
     * <td>This method returns S_OK and sets <i>ppenumMoniker</i> to <b>NULL</b>.</td>
     * </tr>
     * <tr>
     * <td>Generic composite moniker</td>
     * <td>If successful, this method returns S_OK and passes back an enumerator that enumerates the component monikers that make up the composite; otherwise, the method returns E_OUTOFMEMORY. </td>
     * </tr>
     * <tr>
     * <td>Item moniker</td>
     * <td>This method returns S_OK and sets <i>ppenumMoniker</i> to <b>NULL</b>.</td>
     * </tr>
     * <tr>
     * <td>OBJREF moniker</td>
     * <td>This method returns S_OK and sets <i>ppenumMoniker</i> to <b>NULL</b>.</td>
     * </tr>
     * <tr>
     * <td>Pointer moniker</td>
     * <td>This method returns E_NOTIMPL.</td>
     * </tr>
     * <tr>
     * <td>URL moniker</td>
     * <td>This method returns S_OK and sets <i>ppenumMoniker</i> to <b>NULL</b>.</td>
     * </tr>
     * </table>
     * @param {BOOL} fForward If <b>TRUE</b>, enumerates the monikers from left to right. If <b>FALSE</b>, enumerates from right to left.
     * @returns {IEnumMoniker} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienummoniker">IEnumMoniker</a> pointer variable that receives the interface pointer to the enumerator object for the moniker. When successful, the implementation must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the enumerator object. It is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. If an error occurs or if the moniker has no enumerable components, the implementation sets *<i>ppenumMoniker</i> to <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-imoniker-enum
     */
    Enum(fForward) {
        result := ComCall(12, this, "int", fForward, "ptr*", &ppenumMoniker := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumMoniker(ppenumMoniker)
    }

    /**
     * Determines whether this moniker is identical to the specified moniker.
     * @remarks
     * Previous implementations of the running object table (ROT) called this method. The current implementation of the ROT uses the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-irotdata">IROTData</a> interface instead.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Call this method to determine whether two monikers are identical. The reduced form of a moniker is considered different from the unreduced form. You should call the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-reduce">IMoniker::Reduce</a> method before calling <b>IsEqual</b>, because a reduced moniker is in its most specific form. <b>IsEqual</b> may return S_FALSE on two monikers before they are reduced, and S_OK after they are reduced.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Your implementation should not reduce the current moniker before performing the comparison. It is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-reduce">IMoniker::Reduce</a> to compare reduced monikers.
     * 
     * Two monikers that compare as equal must hash to the same value using <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-hash">IMoniker::Hash</a>.
     * 
     * <h3><a id="Implementation-specific_Notes"></a><a id="implementation-specific_notes"></a><a id="IMPLEMENTATION-SPECIFIC_NOTES"></a>Implementation-specific Notes</h3>
     * <table>
     * <tr>
     * <th>Implementation</th>
     * <th>Notes</th>
     * </tr>
     * <tr>
     * <td>Anti-moniker</td>
     * <td>This method returns S_OK if both are anti-monikers; otherwise, it returns S_FALSE.</td>
     * </tr>
     * <tr>
     * <td>Class moniker</td>
     * <td>This method returns S_OK if <i>pmkOther</i> is a class moniker constructed with the same CLSID information as itself. Otherwise, the method returns S_FALSE. May return E_INVALIDARG if <i>pmkOther</i> is an invalid pointer.</td>
     * </tr>
     * <tr>
     * <td>File moniker</td>
     * <td>This method returns S_OK if *<i>pmkOther</i> is a file moniker and the paths for both monikers are identical (using a case-insensitive comparison). Otherwise, the method returns S_FALSE.</td>
     * </tr>
     * <tr>
     * <td>Generic composite moniker</td>
     * <td>This method returns S_OK if the components of both monikers are equal when compared in the left-to-right order.</td>
     * </tr>
     * <tr>
     * <td>Item moniker</td>
     * <td>This method returns S_OK if both monikers are item monikers and their display names are identical (using a case-insensitive comparison); otherwise, the method returns S_FALSE.</td>
     * </tr>
     * <tr>
     * <td>OBJREF moniker</td>
     * <td>This method returns S_OK if *pmkOther is an OBJREF moniker and the paths for both monikers are identical (using a case-insensitive comparison). Otherwise, the method returns S_FALSE.</td>
     * </tr>
     * <tr>
     * <td>Pointer moniker</td>
     * <td>This method returns S_OK only if both are pointer monikers and the interface pointers that they wrap are identical.</td>
     * </tr>
     * <tr>
     * <td>URL moniker</td>
     * <td>Returns S_FALSE if the other moniker (<i>pmkOtherMoniker</i>) is not an URL moniker, which it checks using <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersist-getclassid">IPersist::GetClassID</a> to see whether the CLSID is CLSID_URLMoniker. If the other moniker is an URL moniker, it compares the display names of the monikers for equality, returning S_OK if they are identical or S_FALSE otherwise.</td>
     * </tr>
     * </table>
     * @param {IMoniker} pmkOtherMoniker A  pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface on the moniker to be used for comparison with this one (the one from which this method is called).
     * @returns {HRESULT} This method returns S_OK to indicate that the two monikers are identical, and S_FALSE otherwise.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-imoniker-isequal
     */
    IsEqual(pmkOtherMoniker) {
        result := ComCall(13, this, "ptr", pmkOtherMoniker, "int")
        return result
    }

    /**
     * Creates a hash value using the internal state of the moniker.
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * You can use the value returned by this method to maintain a hash table of monikers. The hash value determines a hash bucket in the table. To search such a table for a specified moniker, calculate its hash value and then compare it to the monikers in that hash bucket using <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-isequal">IMoniker::IsEqual</a>.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * The hash value must be constant for the lifetime of the moniker. Two monikers that compare as equal using <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-isequal">IMoniker::IsEqual</a> must hash to the same value.
     * 
     * Marshaling and then unmarshaling a moniker should have no effect on its hash value. Consequently, your implementation of <b>IMoniker::Hash</b> should rely only on the internal state of the moniker, not on its memory address.
     * 
     * <h3><a id="Implementation-specific_Notes"></a><a id="implementation-specific_notes"></a><a id="IMPLEMENTATION-SPECIFIC_NOTES"></a>Implementation-specific Notes</h3>
     * <table>
     * <tr>
     * <th>Implementation</th>
     * <th>Notes</th>
     * </tr>
     * <tr>
     * <td>Anti-moniker</td>
     * <td>This method calculates a hash value for the moniker.</td>
     * </tr>
     * <tr>
     * <td>Class moniker</td>
     * <td>This method calculates a hash value for the moniker and returns S_OK. May return E_INVALIDARG if <i>pdwHash</i> is an invalid pointer.</td>
     * </tr>
     * <tr>
     * <td>File moniker</td>
     * <td>This method calculates a hash value for the moniker.</td>
     * </tr>
     * <tr>
     * <td>Generic composite moniker</td>
     * <td>This method calculates a hash value for the moniker.</td>
     * </tr>
     * <tr>
     * <td>Item moniker</td>
     * <td>This method calculates a hash value for the moniker.</td>
     * </tr>
     * <tr>
     * <td>OBJREF moniker</td>
     * <td>This method calculates a hash value for the moniker.</td>
     * </tr>
     * <tr>
     * <td>Pointer moniker</td>
     * <td>This method calculates a hash value for the moniker.</td>
     * </tr>
     * <tr>
     * <td>URL moniker</td>
     * <td>Creates a hash value based on the URL string of the moniker. This hash value is identical when URL strings are identical, although it may also be identical for different URL strings. This method is used to speed up comparisons by reducing the amount of time that it is necessary to call <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-isequal">IMoniker::IsEqual</a>.</td>
     * </tr>
     * </table>
     * @returns {Integer} A pointer to a variable that receives the hash value.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-imoniker-hash
     */
    Hash() {
        result := ComCall(14, this, "uint*", &pdwHash := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwHash
    }

    /**
     * Determines whether the object identified by this moniker is currently loaded and running.
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * If speed is important when you're requesting services from the object identified by the moniker, you may want those services only if the object is already running (because loading an object into the running state may be time-consuming). In such a situation, you should call <b>IsRunning</b> to determine whether the object is running.
     * 
     * For the monikers stored within linked objects, <b>IsRunning</b> is primarily called by the default handler's implementation of <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolelink-bindifrunning">IOleLink::BindIfRunning</a>.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * To get a pointer to the ROT, your implementation should call <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ibindctx-getrunningobjecttable">IBindCtx::GetRunningObjectTable</a> on the <i>pbc</i> parameter. Your implementation can then call <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-irunningobjecttable-isrunning">IRunningObjectTable::IsRunning</a> to determine whether the object identified by the moniker is running. The object identified by the moniker must have registered itself with the ROT when it first began running.
     * 
     * <h3><a id="Implementation-specific_Notes"></a><a id="implementation-specific_notes"></a><a id="IMPLEMENTATION-SPECIFIC_NOTES"></a>Implementation-specific Notes</h3>
     * <table>
     * <tr>
     * <th>Implementation</th>
     * <th>Notes</th>
     * </tr>
     * <tr>
     * <td>Anti-moniker</td>
     * <td>
     * This method checks the ROT to see whether the object is running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>Class moniker</td>
     * <td>
     * This method returns E_NOTIMPL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>File moniker</td>
     * <td>
     * If <i>pmkNewlyRunning</i> is non-<b>NULL</b>, this method returns <b>TRUE</b> if that moniker is equal to this moniker. Otherwise, the method asks the ROT whether this moniker is running. The method ignores <i>pmkToLeft</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>Generic composite moniker</td>
     * <td>
     * If <i>pmkToLeft</i> is non-<b>NULL</b>, this method composes <i>pmkToLeft</i> with this moniker and calls <b>IsRunning</b> on the result.
     * 
     * If <i>pmkToLeft</i> is <b>NULL</b>, this method returns <b>TRUE</b> if pmkNewlyRunning is non-<b>NULL</b> and is equal to this moniker.
     * 
     * If <i>pmkToLeft</i> and <i>pmkNewlyRunning</i> are both <b>NULL</b>, this method checks the ROT to see whether the moniker is running. If so, the method returns S_OK; otherwise, it recursively calls <b>IsRunning</b> on the rightmost component of the composite, passing the remainder of the composite as the <i>pmkToLeft</i> parameter for that call. This handles the case where the moniker identifies a pseudo-object that is not registered as running; see the item moniker implementation for more details.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>Item moniker</td>
     * <td>
     * If pmkToLeft is <b>NULL</b>, this method returns <b>TRUE</b> if <i>pmkNewlyRunning</i> is non-<b>NULL</b> and is equal to this moniker. Otherwise, the method checks the ROT to see whether this moniker is running.
     * 
     * If pmkToLeft is non-<b>NULL</b>, the method calls <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-bindtoobject">IMoniker::BindToObject</a> on the <i>pmkToLeft</i> parameter, requesting an <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleitemcontainer">IOleItemContainer</a> interface pointer. The method then calls <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleitemcontainer-isrunning">IOleItemContainer::IsRunning</a>, passing the string contained within this moniker.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>OBJREF moniker</td>
     * <td>
     * Because OBJREF monikers represent a running object instance, this method returns <b>TRUE</b> unless the object is known to be no longer running because a recent call failed. The method ignores <i>pmkToLeft</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>Pointer moniker</td>
     * <td>
     * This method always returns S_OK, because the object identified by a pointer moniker must always be running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>URL moniker</td>
     * <td>
     * Returns S_OK if this moniker is currently running. Otherwise, it returns S_FALSE. The URL moniker determines whether it is running by first checking whether it is equal to the newly running moniker, by making the following call: pmkNewlyRunning-&gt;IsEqual. Typically, this call is an inexpensive operation. If this does not succeed, the moniker next checks to see whether it is registered with the ROT of the passed-in bind context.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {IBindCtx} pbc A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> interface on the bind context to be used in this binding operation. The bind context caches objects bound during the binding process, contains parameters that apply to all operations using the bind context, and provides the means by which the moniker implementation should retrieve information about its environment.
     * @param {IMoniker} pmkToLeft A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface on the moniker to the left of this moniker if this moniker is part of a composite. This parameter is used primarily by moniker implementers to enable cooperation between the various components of a composite moniker; moniker clients can usually pass <b>NULL</b>.
     * @param {IMoniker} pmkNewlyRunning A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface on the moniker most recently added to the running object table (ROT). This can be <b>NULL</b>. If non-<b>NULL</b>, the implementation can return the results of calling <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-isequal">IMoniker::IsEqual</a> on the <i>pmkNewlyRunning</i> parameter, passing the current moniker. This parameter is intended to enable <b>IsRunning</b> implementations that are more efficient than just searching the ROT, but the implementation can choose to ignore <i>pmkNewlyRunning</i> without causing any harm.
     * @returns {HRESULT} This method can return the standard return values E_UNEXPECTED, as well as the following values.
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
     * The moniker is running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The moniker is not running.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-imoniker-isrunning
     */
    IsRunning(pbc, pmkToLeft, pmkNewlyRunning) {
        result := ComCall(15, this, "ptr", pbc, "ptr", pmkToLeft, "ptr", pmkNewlyRunning, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the time at which the object identified by this moniker was last changed.
     * @remarks
     * To be precise, the time returned is the earliest time COM can identify after which no change has occurred, so this time may be later than the time of the last change to the object.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * If you're caching information returned by the object identified by the moniker, you may want to ensure that your information is up-to-date. To do so, you would call <b>GetTimeOfLastChange</b> and compare the time returned with the time you last retrieved information from the object. 
     * 
     * 
     * 
     * For the monikers stored within linked objects, <b>GetTimeOfLastChange</b> is primarily called by the default handler's implementation of <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-isuptodate">IOleObject::IsUpToDate</a>. Container applications call <b>IOleObject::IsUpToDate</b> to determine if a linked object (or an embedded object containing linked objects) is up-to-date without actually binding to the object. This enables an application to determine quickly which linked objects require updating when the end user opens a document. The application can then bind only those linked objects that need updating (after prompting the end user to determine whether they should be updated) instead of binding every linked object in the document.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * It is important to perform this operation quickly because, for linked objects, this method is called when a user first opens a compound document. Consequently, your <b>GetTimeOfLastChange</b> implementation should not bind to any objects. In addition, your implementation should check the deadline parameter in the bind context and return MK_E_EXCEEDEDDEADLINE if the operation cannot be completed by the specified time.
     * 
     * Following are some strategies you can use in your implementations: 
     * 
     * 
     * 
     * <ul>
     * <li>
     * For many types of monikers, the pmkToLeft parameter identifies the container of the object identified by this moniker. If this is true of your moniker class, you can simply call <b>GetTimeOfLastChange</b> on the <i>pmkToLeft</i> parameter, because an object cannot have changed at a date later than its container.
     * 
     * </li>
     * <li>
     * You can get a pointer to the running object table (ROT) by calling <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ibindctx-getrunningobjecttable">IBindCtx::GetRunningObjectTable</a> on the <i>pbc</i> parameter and then calling <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-irunningobjecttable-gettimeoflastchange">IRunningObjectTable::GetTimeOfLastChange</a>, because the ROT generally records the time of last change.
     * 
     * </li>
     * <li>
     * You can get the storage associated with this moniker (or the <i>pmkToLeft</i> moniker) and return the storage's last modification time with a call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-stat">IStorage::Stat</a>.
     * 
     * </li>
     * </ul>
     * <h3><a id="Implementation-specific_Notes"></a><a id="implementation-specific_notes"></a><a id="IMPLEMENTATION-SPECIFIC_NOTES"></a>Implementation-specific Notes</h3>
     * <table>
     * <tr>
     * <th>Implementation</th>
     * <th>Notes</th>
     * </tr>
     * <tr>
     * <td>Anti-moniker</td>
     * <td>This method returns E_NOTIMPL.</td>
     * </tr>
     * <tr>
     * <td>Class moniker</td>
     * <td>This method returns MK_E_UNAVAILABLE.</td>
     * </tr>
     * <tr>
     * <td>File moniker</td>
     * <td>If this moniker is in the ROT, this method returns the last change time registered there; otherwise, it returns the last write time for the file. If the file cannot be found, this method returns MK_E_NOOBJECT.</td>
     * </tr>
     * <tr>
     * <td>Generic composite moniker</td>
     * <td>This method creates a composite of <i>pmkToLeft</i> (if non-<b>NULL</b>) and this moniker and uses the ROT to retrieve the time of last change. If the object is not in the ROT, the method recursively calls <b>GetTimeOfLastChange</b> on the rightmost component of the composite, passing the remainder of the composite as the <i>pmkToLeft</i> parameter for that call.</td>
     * </tr>
     * <tr>
     * <td>Item moniker</td>
     * <td>If <i>pmkToLeft</i> is <b>NULL</b>, this method returns MK_E_NOTBINDABLE. Otherwise, the method creates a composite of <i>pmkToLeft</i> and this moniker and uses the ROT to access the time of last change. If the object is not in the ROT, the method calls <b>GetTimeOfLastChange</b> on the <i>pmkToLeft</i> parameter.</td>
     * </tr>
     * <tr>
     * <td>OBJREF moniker</td>
     * <td>This method returns E_NOTIMPL.</td>
     * </tr>
     * <tr>
     * <td>Pointer moniker</td>
     * <td>This method returns E_NOTIMPL.</td>
     * </tr>
     * <tr>
     * <td>URL moniker</td>
     * <td>This method returns the time of last change of an object that is registered in the ROT.</td>
     * </tr>
     * </table>
     * @param {IBindCtx} pbc A pointer to the bind context to be used in this binding operation. The bind context caches objects bound during the binding process, contains parameters that apply to all operations using the bind context, and provides the means by which the moniker implementation should retrieve information about its environment. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a>.
     * @param {IMoniker} pmkToLeft If the moniker is part of a composite moniker, pointer to the moniker to the left of this moniker. This parameter is primarily used by moniker implementers to enable cooperation between the various components of a composite moniker. Moniker clients should pass <b>NULL</b>.
     * @returns {FILETIME} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that receives the time of last change. A value of {0xFFFFFFFF,0x7FFFFFFF} indicates an error (for example, exceeded time limit, information not available).
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-imoniker-gettimeoflastchange
     */
    GetTimeOfLastChange(pbc, pmkToLeft) {
        pFileTime := FILETIME()
        result := ComCall(16, this, "ptr", pbc, "ptr", pmkToLeft, "ptr", pFileTime, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pFileTime
    }

    /**
     * Creates a moniker that is the inverse of this moniker. When composed to the right of this moniker or one of similar structure, the moniker will compose to nothing.
     * @remarks
     * The inverse of a moniker is analogous to the ".." directory in MS-DOS file systems; the ".." directory acts as the inverse to any other directory name, because appending ".." to a directory name results in an empty path. In the same way, the inverse of a moniker typically is also the inverse of all monikers in the same class. However, it is not necessarily the inverse of a moniker of a different class.
     * 
     * The inverse of a composite moniker is a composite consisting of the inverses of the components of the original moniker, arranged in reverse order. For example, if the inverse of A is Inv( A ) and the composite of A, B, and C is Comp( A, B, C ), then
     * 
     * Inv( Comp( A, B, C ) ) is equal to Comp( Inv( C ), Inv( B ), Inv( A ) ).
     * 
     * Not all monikers have inverses. Most monikers that are themselves inverses, such as anti-monikers, do not have inverses. Monikers that have no inverse cannot have relative monikers formed from inside the objects they identify to other objects outside.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * An object that is using a moniker to locate another object usually does not know the class of the moniker it is using. To get the inverse of a moniker, you should always call <b>IMoniker::Inverse</b> rather than the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-createantimoniker">CreateAntiMoniker</a> function, because you cannot be certain that the moniker you're using considers an anti-moniker to be its inverse. 
     * 
     * 
     * 
     * The <b>Inverse</b> method is also called by the implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-relativepathto">IMoniker::RelativePathTo</a> method, to assist in constructing a relative moniker.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * If your monikers have no internal structure, you can call the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-createantimoniker">CreateAntiMoniker</a> function in to get an anti-moniker in your implementation of <b>IMoniker::Inverse</b>. In your implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-composewith">IMoniker::ComposeWith</a>, you need to check for the inverse you supply in the implementation of <b>Inverse</b>.
     * 
     * <h3><a id="Implementation-specific_Notes"></a><a id="implementation-specific_notes"></a><a id="IMPLEMENTATION-SPECIFIC_NOTES"></a>Implementation-specific Notes</h3>
     * <table>
     * <tr>
     * <th>Implementation</th>
     * <th>Notes</th>
     * </tr>
     * <tr>
     * <td>Anti-moniker</td>
     * <td>This method returns MK_E_NOINVERSE and sets *<i>ppmk</i> to <b>NULL</b>.</td>
     * </tr>
     * <tr>
     * <td>Class moniker</td>
     * <td>This method returns an anti-moniker (that is, the results of calling <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-createantimoniker">CreateAntiMoniker</a>).</td>
     * </tr>
     * <tr>
     * <td>File moniker</td>
     * <td>This method returns an anti-moniker (that is, the results of calling <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-createantimoniker">CreateAntiMoniker</a>).</td>
     * </tr>
     * <tr>
     * <td>Generic composite moniker</td>
     * <td>This method returns a composite moniker that consists of the inverses of each of the components of the original composite, stored in reverse order. For example, if the inverse of A is Inv( A ), the inverse of the composite of A, B, and C is Comp(Inv( C ), Inv( B ), Inv( A ) ).</td>
     * </tr>
     * <tr>
     * <td>Item moniker</td>
     * <td>This method returns an anti-moniker (that is, the results of calling <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-createantimoniker">CreateAntiMoniker</a>).</td>
     * </tr>
     * <tr>
     * <td>OBJREF moniker</td>
     * <td>This method returns an anti-moniker (that is, the results of calling <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-createantimoniker">CreateAntiMoniker</a>).</td>
     * </tr>
     * <tr>
     * <td>Pointer moniker</td>
     * <td>This method returns an anti-moniker (that is, the results of calling <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-createantimoniker">CreateAntiMoniker</a>).</td>
     * </tr>
     * <tr>
     * <td>URL moniker</td>
     * <td>This method returns MK_E_NOINVERSE and sets *<i>ppmk</i> to <b>NULL</b>.</td>
     * </tr>
     * </table>
     * @returns {IMoniker} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> pointer variable that receives the interface pointer to a moniker that is the inverse of this moniker. When successful, the implementation must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the new inverse moniker. It is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. If an error occurs, the implementation should set *<i>ppmk</i> to <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-imoniker-inverse
     */
    Inverse() {
        result := ComCall(17, this, "ptr*", &ppmk := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMoniker(ppmk)
    }

    /**
     * Creates a new moniker based on the prefix that this moniker has in common with the specified moniker.
     * @remarks
     * <b>CommonPrefixWith</b> creates a new moniker that consists of the common prefixes of the moniker on this moniker object and another moniker. For example, if one moniker represents the path "c:\projects\secret\art\pict1.bmp" and another moniker represents the path "c:\projects\secret\docs\chap1.txt", the common prefix of these two monikers would be a moniker representing the path "c:\projects\secret".
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * The <b>CommonPrefixWith</b> method is primarily called in the implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-relativepathto">IMoniker::RelativePathTo</a> method. Clients using a moniker to locate an object rarely need to call this method.
     * 
     * 
     * 
     * Call this method only if <i>pmkOther</i> and this moniker are both absolute monikers. An absolute moniker is either a file moniker or a generic composite whose leftmost component is a file moniker that represents an absolute path. Do not call this method on relative monikers because it would not produce meaningful results.
     * 
     * 
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Your implementation should first determine whether <i>pmkOther</i> is a moniker of a class that you recognize and for which you can provide special handling (for example, if it is of the same class as this moniker). If so, your implementation should determine the common prefix of the two monikers. Otherwise, it should pass both monikers in a call to the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-monikercommonprefixwith">MonikerCommonPrefixWith</a> function, which correctly handles the generic case. 
     * 
     * 
     * <h3><a id="Implementation-specific_Notes"></a><a id="implementation-specific_notes"></a><a id="IMPLEMENTATION-SPECIFIC_NOTES"></a>Implementation-specific Notes</h3>
     * <table>
     * <tr>
     * <th>Implementation</th>
     * <th>Notes</th>
     * </tr>
     * <tr>
     * <td>Anti-moniker</td>
     * <td>
     * If the other moniker is also an anti-moniker, the method returns MK_S_US and sets ppmkPrefix to this moniker. Otherwise, the method calls the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-monikercommonprefixwith">MonikerCommonPrefixWith</a> function. This function correctly handles the case where the other moniker is a generic composite.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>Class moniker</td>
     * <td>
     * If <i>pmkOther</i> is equal to this moniker, retrieves a pointer to this moniker and returns MK_S_US. If <i>pmkOther</i> is a class moniker but is not equal to this moniker, returns MK_E_NOPREFIX. Otherwise, returns the result of calling <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-monikercommonprefixwith">MonikerCommonPrefixWith</a> with itself as <i>pmkThis</i>, <i>pmkOther</i>, and <i>ppmkPrefix</i>, which handles the case where <i>pmkOther</i> is a generic composite moniker.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>File moniker</td>
     * <td>
     * If both monikers are file monikers, this method returns a file moniker that is based on the common components at the beginning of two file monikers. Components of a file moniker can be of the following types:
     * 
     * <ul>
     * <li>A computer name of the form \\server\share. A computer name is treated as a single component, so two monikers representing the paths "\\myserver\public\work" and "\\myserver\private\games" do not have "\\myserver" as a common prefix.</li>
     * <li>A drive designation (for example, "C:").</li>
     * <li>A directory or file name.</li>
     * </ul>
     * If the other moniker is not a file moniker, this method passes both monikers in a call to the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-monikercommonprefixwith">MonikerCommonPrefixWith</a> function. This function correctly handles the case where the other moniker is a generic composite.
     * 
     * This method returns MK_E_NOPREFIX if there is no common prefix.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>Generic composite moniker</td>
     * <td>
     * If the other moniker is a composite, this method compares the components of each composite from left to right. The returned common prefix moniker might also be a composite moniker, depending on how many of the leftmost components were common to both monikers. If the other moniker is not a composite, the method simply compares it to the leftmost component of this moniker.
     * 
     * If the monikers are equal, the method returns MK_S_US and sets <i>ppmkPrefix</i> to this moniker. If the other moniker is a prefix of this moniker, the method returns MK_S_HIM and sets <i>ppmkPrefix</i> to the other moniker. If this moniker is a prefix of the other, this method returns MK_S_ME and sets <i>ppmkPrefix</i> to this moniker.
     * 
     * If there is no common prefix, this method returns MK_E_NOPREFIX and sets <i>ppmkPrefix</i> to <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>Item moniker</td>
     * <td>
     * If the other moniker is an item moniker that is equal to this moniker, this method sets *<i>ppmkPrefix</i> to this moniker and returns MK_S_US; otherwise, the method calls the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-monikercommonprefixwith">MonikerCommonPrefixWith</a> function. This function correctly handles the case where the other moniker is a generic composite.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>OBJREF moniker</td>
     * <td>
     * If the two monikers are equal, this method returns MK_S_US and sets *<i>ppmkPrefix</i> to <b>NULL</b>. If the other moniker is not an OBJREF moniker, this method passes both monikers to the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-monikercommonprefixwith">MonikerCommonPrefixWith</a> function. This function correctly handles the case where the other moniker is a generic composite.
     * 
     * If there is no common prefix, this method returns MK_E_NOPREFIX.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>Pointer moniker</td>
     * <td>
     * If the two monikers are equal, this method returns MK_S_US and sets *<i>ppmkPrefix</i> to this moniker. Otherwise, the method returns MK_E_NOPREFIX and sets *<i>ppmkPrefix</i> to <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>URL moniker</td>
     * <td>
     * This method returns E_NOTIMPL.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {IMoniker} pmkOther A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface on another moniker to be compared with this one to determine whether there is a common prefix.
     * @returns {IMoniker} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a>* pointer variable that receives the interface pointer to the moniker that is the common prefix of this moniker and pmkOther. When successful, the implementation must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the resulting moniker; it is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. If an error occurs or if there is no common prefix, the implementation should set *<i>ppmkPrefix</i> to <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-imoniker-commonprefixwith
     */
    CommonPrefixWith(pmkOther) {
        result := ComCall(18, this, "ptr", pmkOther, "ptr*", &ppmkPrefix := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMoniker(ppmkPrefix)
    }

    /**
     * Creates a relative moniker between this moniker and the specified moniker.
     * @remarks
     * A relative moniker is analogous to a relative path (such as "..\backup"). For example, suppose you have one moniker that represents the path "c:\projects\secret\art\pict1.bmp" and another moniker that represents the path "c:\projects\secret\docs\chap1.txt". Calling <b>RelativePathTo</b> on the first moniker, passing the second one as the <i>pmkOther</i> parameter, would create a relative moniker representing the path "..\docs\chap1.txt".
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Moniker clients typically do not need to call <b>RelativePathTo</b>. This method is called primarily by the default handler for linked objects. Linked objects contain both an absolute and a relative moniker to identify the link source. (This enables link tracking if the user moves a directory tree containing both the container and source files.) The default handler calls this method to create a relative moniker from the container document to the link source. (That is, it calls <b>RelativePathTo</b> on the moniker identifying the container document, passing the moniker identifying the link source as the <i>pmkOther</i> parameter.)
     * 
     * If you do call <b>RelativePathTo</b>, call it only on absolute monikers, for example, a file moniker or a composite moniker whose leftmost component is a file moniker, where the file moniker represents an absolute path. Do not call this method on relative monikers.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Your implementation of <b>RelativePathTo</b> should first determine whether <i>pmkOther</i> is a moniker of a class that you recognize and for which you can provide special handling (for example, if it is of the same class as this moniker). If so, your implementation should determine the relative path. Otherwise, it should pass both monikers in a call to the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-monikerrelativepathto">MonikerRelativePathTo</a> function, which correctly handles the generic case.
     * 
     * The first step in determining a relative path is determining the common prefix of this moniker and <i>pmkOther</i>. The next step is to break this moniker and <i>pmkOther</i> into two parts each, say (P, myTail) and (P, otherTail) respectively, where P is the common prefix. The correct relative path is then the inverse of myTail composed with otherTail:
     * 
     * Comp( Inv( myTail ), otherTail )
     * 
     * where Comp() represents the composition operation and Inv() represents the inverse operation.
     * 
     * For certain types of monikers, you cannot use your <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-inverse">IMoniker::Inverse</a> method to construct the inverse of myTail. For example, a file moniker returns an anti-moniker as an inverse, while its <b>RelativePathTo</b> method must use one or more file monikers that each represent the path ".." to construct the inverse of myTail.
     * 
     * <h3><a id="Implementation-specific_Notes"></a><a id="implementation-specific_notes"></a><a id="IMPLEMENTATION-SPECIFIC_NOTES"></a>Implementation-specific Notes</h3>
     * <table>
     * <tr>
     * <th>Implementation</th>
     * <th>Notes</th>
     * </tr>
     * <tr>
     * <td>Anti-moniker</td>
     * <td>This method returns MK_S_HIM and sets *<i>ppmkRelPath</i> to the other moniker.</td>
     * </tr>
     * <tr>
     * <td>Class moniker</td>
     * <td>This method returns the result of calling <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-monikerrelativepathto">MonikerRelativePathTo</a> with <i>pmkSrc</i> equal to this moniker, <i>pmkOther</i>, <i>ppmkRelPath</i>, and <b>TRUE</b> as <i>dwReserved</i>.</td>
     * </tr>
     * <tr>
     * <td>File moniker</td>
     * <td>This method computes a moniker which when composed to the right of this moniker yields the other moniker. For example, if the path of this moniker is "C:\work\docs\report.doc" and if the other moniker is "C:\work\art\picture.bmp", the path of the computed moniker would be "..\..\art\picture.bmp". </td>
     * </tr>
     * <tr>
     * <td>Generic composite moniker</td>
     * <td>This method finds the common prefix of the two monikers and creates two monikers that consist of the remainder when the common prefix is removed. Then it creates the inverse for the remainder of this moniker and composes the remainder of the other moniker on the right of it.</td>
     * </tr>
     * <tr>
     * <td>Item moniker</td>
     * <td>This method returns MK_E_NOTBINDABLE and sets *<i>ppmkRelPath</i> to <b>NULL</b>.</td>
     * </tr>
     * <tr>
     * <td>OBJREF moniker</td>
     * <td>This method returns E_NOTIMPL.</td>
     * </tr>
     * <tr>
     * <td>Pointer moniker</td>
     * <td>This method returns E_NOTIMPL.</td>
     * </tr>
     * <tr>
     * <td>URL moniker</td>
     * <td>This method returns E_NOTIMPL.</td>
     * </tr>
     * </table>
     * @param {IMoniker} pmkOther A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface on the moniker to which a relative path should be taken.
     * @returns {IMoniker} A pointer to an  <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> pointer variable that receives the interface pointer to the relative moniker. When successful, the implementation must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the new moniker; it is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. If an error occurs, the implementation sets *<i>ppmkRelPath</i> to <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-imoniker-relativepathto
     */
    RelativePathTo(pmkOther) {
        result := ComCall(19, this, "ptr", pmkOther, "ptr*", &ppmkRelPath := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMoniker(ppmkRelPath)
    }

    /**
     * Retrieves the display name for the moniker.
     * @remarks
     * <b>GetDisplayName</b> provides a string that is a displayable representation of the moniker. A display name is not a complete representation of a moniker's internal state; it is simply a form that can be read by users. As a result, it is possible (though rare) for two different monikers to have the same display name. While there is no guarantee that the display name of a moniker can be parsed back into that moniker when calling the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-mkparsedisplayname">MkParseDisplayName</a> function with it, failure to do so is rare.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * It is possible that retrieving a moniker's display name may be an expensive operation. For efficiency, you may want to cache the results of the first successful call to <b>GetDisplayName</b>, rather than making repeated calls.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * If you are writing a moniker class in which the display name does not change, simply cache the display name and supply the cached name when requested. If the display name can change over time, getting the current display name might mean that the moniker has to access the object's storage or bind to the object, either of which can be expensive operations. If this is the case, your implementation of <b>GetDisplayName</b> should return MK_E_EXCEEDEDDEADLINE if the name cannot be retrieved by the time specified in the bind context's <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-bind_opts">BIND_OPTS</a> structure.
     * 
     * A moniker that is intended to be part of a generic composite moniker should include any preceding delimiter (such as '\') as part of its display name. For example, the display name returned by an item moniker includes the delimiter specified when it was created with the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-createitemmoniker">CreateItemMoniker</a> function. The display name for a file moniker does not include a delimiter because file monikers are always expected to be the leftmost component of a composite.
     * 
     * <h3><a id="Implementation-specific_Notes"></a><a id="implementation-specific_notes"></a><a id="IMPLEMENTATION-SPECIFIC_NOTES"></a>Implementation-specific Notes</h3>
     * <table>
     * <tr>
     * <th>Implementation</th>
     * <th>Notes</th>
     * </tr>
     * <tr>
     * <td>Anti-moniker</td>
     * <td>For each anti-moniker contained in this moniker, this method return one instance of "\..".</td>
     * </tr>
     * <tr>
     * <td>Class moniker</td>
     * <td>The display name for class monikers is of the following form: clsid:<i>string-clsid-no-curly-braces</i> *[";" <i>clsid-param</i>=<i>value</i>]:. For example, clsid:a7b90590-36fd-11cf-857d-00aa006d2ea4:.</td>
     * </tr>
     * <tr>
     * <td>File moniker</td>
     * <td>This method returns the path that the moniker represents.</td>
     * </tr>
     * <tr>
     * <td>Generic composite moniker</td>
     * <td>This method returns the concatenation of the display names returned by each component moniker of the composite.</td>
     * </tr>
     * <tr>
     * <td>Item moniker</td>
     * <td>This method returns the concatenation of the delimiter and the item name that were specified when the item moniker was created.</td>
     * </tr>
     * <tr>
     * <td>OBJREF moniker</td>
     * <td>This method obtains the display name for the OBJREF moniker. The display name is a 64-bit encoding that encapsulates the machine location, process endpoint, and interface pointer ID (IPID) of the running object. For future compatibility, the display name is restricted to characters that can be specified as part of a URL.</td>
     * </tr>
     * <tr>
     * <td>Pointer moniker</td>
     * <td>This method returns E_NOTIMPL.</td>
     * </tr>
     * <tr>
     * <td>URL moniker</td>
     * <td>The URL moniker attempts to return its full URL string. If the moniker was created with a partial URL string (see <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775103(v=vs.85)">CreateURLMonikerEx</a>), it will first attempt to find an URL moniker in the bind context under SZ_URLCONTEXT and will next look to the moniker to its left for contextual information. If it cannot return its full URL string, it will return its partial URL string.</td>
     * </tr>
     * </table>
     * @param {IBindCtx} pbc A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> interface on the bind context to be used in this operation. The bind context caches objects bound during the binding process, contains parameters that apply to all operations using the bind context, and provides the means by which the moniker implementation should retrieve information about its environment.
     * @param {IMoniker} pmkToLeft If the moniker is part of a composite moniker, pointer to the moniker to the left of this moniker. This parameter is used primarily by moniker implementers to enable cooperation between the various components of a composite moniker. Moniker clients should pass <b>NULL</b>.
     * @returns {PWSTR} The address of a pointer variable that receives a pointer to the display name string for the moniker. The implementation must use <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-alloc">IMalloc::Alloc</a> to allocate the string returned in <i>ppszDisplayName</i>, and the caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-free">IMalloc::Free</a> to free it. Both the caller and the implementation of this method use the COM task allocator returned by <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cogetmalloc">CoGetMalloc</a>. If an error occurs, the implementation must set *<i>ppszDisplayName</i> should be set to <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-imoniker-getdisplayname
     */
    GetDisplayName(pbc, pmkToLeft) {
        result := ComCall(20, this, "ptr", pbc, "ptr", pmkToLeft, "ptr*", &ppszDisplayName := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszDisplayName
    }

    /**
     * Converts a display name into a moniker.
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Moniker clients do not typically call <b>ParseDisplayName</b> directly. Instead, they call the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-mkparsedisplayname">MkParseDisplayName</a> function when they want to convert a display name into a moniker (for example, in implementing the <b>Links</b> dialog box for a container application, or for implementing a macro language that supports references to objects outside the document). That function first parses the initial portion of the display name itself.
     * 
     * It then calls <b>ParseDisplayName</b> on the moniker it has just created, passing the remainder of the display name and getting a new moniker in return; this step is repeated until the entire display name has been parsed.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Your implementation may be able to perform this parsing by itself if your moniker class is designed to designate only certain kinds of objects. Otherwise, you must get an <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-iparsedisplayname">IParseDisplayName</a> interface pointer for the object identified by the moniker-so-far (that is, the composition of <i>pmkToLeft</i> and this moniker) and then return the results of calling <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iparsedisplayname-parsedisplayname">IParseDisplayName::ParseDisplayName</a>.
     * 
     * There are different strategies for getting an <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-iparsedisplayname">IParseDisplayName</a> pointer, as follows:
     * 
     * <ul>
     * <li>You can try to get the object's CLSID (by calling <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersist-getclassid">IPersist::GetClassID</a> on the object) and then call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cogetclassobject">CoGetClassObject</a> function, requesting the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-iparsedisplayname">IParseDisplayName</a> interface on the class factory associated with that CLSID.</li>
     * <li>You can try to bind to the object itself to get an <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-iparsedisplayname">IParseDisplayName</a> pointer.</li>
     * <li>You can try binding to the object identified by <i>pmkToLeft</i> to get an <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleitemcontainer">IOleItemContainer</a> pointer and then call <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleitemcontainer-getobject">IOleItemContainer::GetObject</a> to get an <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-iparsedisplayname">IParseDisplayName</a> pointer for the item.</li>
     * </ul>
     * Any objects that are bound should be registered with the bind context (see <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ibindctx-registerobjectbound">IBindCtx::RegisterObjectBound</a>) to ensure that they remain running for the duration of the parsing operation.
     * 
     * <h3><a id="Implementation-specific_Notes"></a><a id="implementation-specific_notes"></a><a id="IMPLEMENTATION-SPECIFIC_NOTES"></a>Implementation-specific Notes</h3>
     * <table>
     * <tr>
     * <th>Implementation</th>
     * <th>Notes</th>
     * </tr>
     * <tr>
     * <td>Anti-moniker</td>
     * <td>
     * This method returns E_NOTIMPL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>Class moniker</td>
     * <td>
     * This method parses the display name by binding to itself for <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-iparsedisplayname">IParseDisplayName</a> and asking the bound object to parse the display name into a moniker, as follows.
     * 
     * 
     * ``` syntax
     *   hr = BindToObject(pbc, pmkToLeft, IID_IParseDisplayName, (void**)&amp;ppdn);
     *   if (SUCCEEDED(hr)) {
     *     hr = ppdn-&gt;ParseDisplayName(pbc, lpszDisplayName, pchEaten, ppmkOut);
     *     ppdn-&gt;Release();
     *   }
     *   return hr;
     * ```
     * 
     * This method tries to acquire an <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-iparsedisplayname">IParseDisplayName</a> pointer, first by binding to the class factory for the object identified by the moniker and then by binding to the object itself. If either of these binding operations is successful, the file moniker passes the unparsed portion of the display name to the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iparsedisplayname-parsedisplayname">IParseDisplayName::ParseDisplayName</a> method.
     * 
     * This method returns MK_E_SYNTAX if <i>pmkToLeft</i> is non-<b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>File moniker</td>
     * <td>
     * This method tries to acquire an <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-iparsedisplayname">IParseDisplayName</a> pointer, first by binding to the class factory for the object identified by the moniker and then by binding to the object itself. If either of these binding operations is successful, the file moniker passes the unparsed portion of the display name to the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iparsedisplayname-parsedisplayname">IParseDisplayName::ParseDisplayName</a> method. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>Generic composite moniker</td>
     * <td>
     * This method recursively calls <b>IMoniker::ParseDisplayName</b> on the rightmost component of the composite, passing everything else as the <i>pmkToLeft</i> parameter for that call.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>Item moniker</td>
     * <td>
     * If <i>pmkToLeft</i> is <b>NULL</b>, this method returns MK_E_SYNTAX. Otherwise, the method calls <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-bindtoobject">IMoniker::BindToObject</a> on the <i>pmkToLeft</i> parameter, requesting an <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleitemcontainer">IOleItemContainer</a> interface pointer. The method then calls <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleitemcontainer-getobject">IOleItemContainer::GetObject</a>, requesting an <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-iparsedisplayname">IParseDisplayName</a> interface pointer to the object identified by the moniker, and passes the display name to <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iparsedisplayname-parsedisplayname">IParseDisplayName::ParseDisplayName</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>OBJREF moniker</td>
     * <td>
     * If <i>pmkToLeft</i> is not <b>NULL</b>, this method returns MK_E_SYNTAX.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>Pointer moniker</td>
     * <td>
     * This method queries the wrapped pointer for the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-iparsedisplayname">IParseDisplayName</a> interface and passes the display name to <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iparsedisplayname-parsedisplayname">IParseDisplayName::ParseDisplayName</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>URL moniker</td>
     * <td>
     * Parses a full or partial URL string into a result moniker (ppmkOut). If <i>szDisplayName</i> represents a full URL string (for example, "http://foo.com/default.html"), the result is a new full URL moniker. If <i>szDisplayName</i> represents a partial URL string (for example, "..\default.html"), the result is a full URL that takes its context from either the bind context's SZ_URLCONTEXT object-parameter or from this URL moniker. For example, if the context moniker was "http://foo.com/pub/list.html" and <i>szDisplayName</i> was "..\default.html", the resulting URL moniker would represent "http://foo.com/default.html".
     * 
     * </td>
     * </tr>
     * </table>
     * @param {IBindCtx} pbc A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> interface on the bind context to be used in this binding operation. The bind context caches objects bound during the binding process, contains parameters that apply to all operations using the bind context, and provides the means by which the moniker implementation should retrieve information about its environment.
     * @param {IMoniker} pmkToLeft A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface on the moniker that has been built out of the display name up to this point.
     * @param {PWSTR} pszDisplayName The remaining display name to be parsed.
     * @param {Pointer<Integer>} pchEaten A pointer to a variable that receives the number of characters in <i>pszDisplayName</i> that were consumed in this step.
     * @param {Pointer<IMoniker>} ppmkOut A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> pointer variable that receives the interface pointer to the moniker that was built from <i>pszDisplayName</i>. When successful, the implementation must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the new moniker; it is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. If an error occurs, the implementation sets *<i>ppmkOut</i> to <b>NULL</b>.
     * @returns {HRESULT} This method can return the standard return valuesE_OUTOFMEMORY and E_UNEXPECTED, as well as the following values.
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
     * The parsing operation was completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MK_E_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error in the syntax of the input components (<i>pmkToLeft</i>, this moniker, and <i>pszDisplayName</i>). For example, a file moniker returns this error if <i>pmkToLeft</i> is non-<b>NULL</b>, and an item moniker returns it if <i>pmkToLeft</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * This method can also return the errors associated with the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-bindtoobject">IMoniker::BindToObject</a> method.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-imoniker-parsedisplayname
     */
    ParseDisplayName(pbc, pmkToLeft, pszDisplayName, pchEaten, ppmkOut) {
        pszDisplayName := pszDisplayName is String ? StrPtr(pszDisplayName) : pszDisplayName

        pchEatenMarshal := pchEaten is VarRef ? "uint*" : "ptr"

        result := ComCall(21, this, "ptr", pbc, "ptr", pmkToLeft, "ptr", pszDisplayName, pchEatenMarshal, pchEaten, "ptr*", ppmkOut, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Determines whether this moniker is one of the system-provided moniker classes.
     * @remarks
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * New values of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-mksys">MKSYS</a> enumeration may be defined in the future; therefore, you should explicitly test for each value you are interested in.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Your implementation of this method must return MKSYS_NONE. You cannot use this function to identify your own monikers (for example, in your implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-composewith">IMoniker::ComposeWith</a>). Instead, you should use your moniker's implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersist-getclassid">IPersist::GetClassID</a> or use <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> to test for your own private interface.
     * 
     * <h3><a id="Implementation-specific_Notes"></a><a id="implementation-specific_notes"></a><a id="IMPLEMENTATION-SPECIFIC_NOTES"></a>Implementation-specific Notes</h3>
     * <table>
     * <tr>
     * <th>Implementation</th>
     * <th>Notes</th>
     * </tr>
     * <tr>
     * <td>Anti-moniker</td>
     * <td>This method returns S_OK and passes back MKSYS_ANTIMONIKER.
     * </td>
     * </tr>
     * <tr>
     * <td>Class moniker</td>
     * <td>This method returns S_OK and passes back MKSYS_CLASSMONIKER. 
     * </td>
     * </tr>
     * <tr>
     * <td>File moniker</td>
     * <td>This method returns S_OK and passes back MKSYS_CLASSMONIKER. 
     * </td>
     * </tr>
     * <tr>
     * <td>Generic composite moniker</td>
     * <td>This method returns S_OK and passes back MKSYS_GENERICCOMPOSITE.
     * </td>
     * </tr>
     * <tr>
     * <td>Item moniker</td>
     * <td>This method returns S_OK and passes back MKSYS_ITEMMONIKER.</td>
     * </tr>
     * <tr>
     * <td>OBJREF moniker</td>
     * <td>This method returns S_OK and passes back MKSYS_OBJREFMONIKER. 
     * </td>
     * </tr>
     * <tr>
     * <td>Pointer moniker</td>
     * <td>This method returns S_OK and passes back MKSYS_POINTERMONIKER.
     * </td>
     * </tr>
     * <tr>
     * <td>URL moniker</td>
     * <td>This method returns S_OK and passes back MKSYS_URLMONIKER.
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} A pointer to a variables that receives one of the values from the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-mksys">MKSYS</a> enumeration and refers to one of the COM moniker classes. This parameter cannot be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-imoniker-issystemmoniker
     */
    IsSystemMoniker() {
        result := ComCall(22, this, "uint*", &pdwMksys := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwMksys
    }
}
