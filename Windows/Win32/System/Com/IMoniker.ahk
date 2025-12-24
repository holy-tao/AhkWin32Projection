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
 * 
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
 * The only time you should explicitly create a generic composite moniker is when you are writing your own moniker class. In your implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-composewith">IMoniker::ComposeWith</a>h, you should attempt to perform a nongeneric composition whenever possible; if you cannot perform a nongeneric composition and generic composition is acceptable, you can call the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-creategenericcomposite">CreateGenericComposite</a> function to create a generic composite moniker.
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
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-imoniker
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
     * @param {IBindCtx} pbc A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> interface on the bind context object, which is used in this binding operation. The bind context caches objects bound during the binding process, contains parameters that apply to all operations using the bind context, and provides the means by which the moniker implementation should retrieve information about its environment.
     * @param {IMoniker} pmkToLeft If the moniker is part of a composite moniker, pointer to the moniker to the left of this moniker. This parameter is primarily used by moniker implementers to enable cooperation between the various components of a composite moniker. Moniker clients should use <b>NULL</b>.
     * @param {Pointer<Guid>} riidResult The IID of the interface the client wishes to use to communicate with the object that the moniker identifies.
     * @returns {Pointer<Void>} The address of pointer variable that receives the interface pointer requested in <i>riid</i>. Upon successful return, *<i>ppvResult</i> contains the requested interface pointer to the object the moniker identifies. When successful, the implementation must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the moniker. It is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. If an error occurs, *<i>ppvResult</i> should be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-imoniker-bindtoobject
     */
    BindToObject(pbc, pmkToLeft, riidResult) {
        result := ComCall(8, this, "ptr", pbc, "ptr", pmkToLeft, "ptr", riidResult, "ptr*", &ppvResult := 0, "HRESULT")
        return ppvResult
    }

    /**
     * Binds to the storage for the specified object. Unlike the IMoniker::BindToObject method, this method does not activate the object identified by the moniker.
     * @param {IBindCtx} pbc A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> interface on the bind context object, which is used in this binding operation. The bind context caches objects bound during the binding process, contains parameters that apply to all operations using the bind context, and provides the means by which the moniker implementation should retrieve information about its environment.
     * @param {IMoniker} pmkToLeft If the moniker is part of a composite moniker, pointer to the moniker to the left of this moniker. This parameter is primarily used by moniker implementers to enable cooperation between the various components of a composite moniker. Moniker clients should use <b>NULL</b>.
     * @param {Pointer<Guid>} riid A reference to the identifier of the storage interface requested, whose pointer will be returned in <i>ppvObj</i>. Storage interfaces commonly requested include <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istorage">IStorage</a>, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ilockbytes">ILockBytes</a>.
     * @returns {Pointer<Void>} The address of pointer variable that receives the interface pointer requested in <i>riid</i>. Upon successful return, *<i>ppvObj</i> contains the requested interface pointer to the storage of the object the moniker identifies. When successful, the implementation must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the storage. It is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. If an error occurs, *<i>ppvObj</i> should be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-imoniker-bindtostorage
     */
    BindToStorage(pbc, pmkToLeft, riid) {
        result := ComCall(9, this, "ptr", pbc, "ptr", pmkToLeft, "ptr", riid, "ptr*", &ppvObj := 0, "HRESULT")
        return ppvObj
    }

    /**
     * Reduces a moniker to its simplest form.
     * @param {IBindCtx} pbc A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> interface on the bind context to be used in this binding operation. The bind context caches objects bound during the binding process, contains parameters that apply to all operations using the bind context, and provides the means by which the moniker implementation should retrieve information about its environment.
     * @param {Integer} dwReduceHowFar Specifies how far this moniker should be reduced. This parameter must be one of the values from the <a href="https://docs.microsoft.com/windows/win32/api/objidl/ne-objidl-mkrreduce">MKRREDUCE</a> enumeration.
     * @param {Pointer<IMoniker>} ppmkToLeft On entry, a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> pointer variable that contains the interface pointer to moniker to the left of this moniker. This parameter is used primarily by moniker implementers to enable cooperation between the various components of a composite moniker; moniker clients can usually pass <b>NULL</b>.
     * 
     * On return, *<i>ppmkToLeft</i> is usually set to <b>NULL</b>, indicating no change in the original moniker to the left. In rare situations, *<i>ppmkToLeft</i> indicates a moniker, indicating that the previous moniker to the left should be disregarded and the moniker returned through *<i>ppmkToLeft</i> is the replacement. In such a situation, the implementation must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the old moniker to the left of this moniker and must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the new returned moniker; the caller must release it later. If an error occurs, the implementation can either leave the interface pointer unchanged or set it to <b>NULL</b>.
     * @returns {IMoniker} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> pointer variable that receives the interface pointer to the reduced form of this moniker, which can be <b>NULL</b> if an error occurs or if this moniker is reduced to nothing. If this moniker cannot be reduced, *<i>ppmkReduced</i> is simply set to this moniker and the return value is MK_S_REDUCED_TO_SELF. If *<i>ppmkReduced</i> is non-<b>NULL</b>, the implementation must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the new moniker; it is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. (This is true even if *<i>ppmkReduced</i> is set to this moniker.)
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-imoniker-reduce
     */
    Reduce(pbc, dwReduceHowFar, ppmkToLeft) {
        result := ComCall(10, this, "ptr", pbc, "uint", dwReduceHowFar, "ptr*", ppmkToLeft, "ptr*", &ppmkReduced := 0, "HRESULT")
        return IMoniker(ppmkReduced)
    }

    /**
     * Creates a new composite moniker by combining the current moniker with the specified moniker.
     * @param {IMoniker} pmkRight A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface on the moniker to compose onto the end of this moniker.
     * @param {BOOL} fOnlyIfNotGeneric If <b>TRUE</b>, the caller requires a nongeneric composition, so the operation should proceed only if <i>pmkRight</i> is a moniker class that this moniker can compose with in some way other than forming a generic composite. If <b>FALSE</b>, the method can create a generic composite if necessary. Most callers should set this parameter to <b>FALSE</b>.
     * @returns {IMoniker} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> pointer variable that receives the composite moniker pointer. When successful, the implementation must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the resulting moniker; it is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. If an error occurs or if the monikers compose to nothing (for example, composing an anti-moniker with an item moniker or a file moniker), *<i>ppmkComposite</i> should be set to <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-imoniker-composewith
     */
    ComposeWith(pmkRight, fOnlyIfNotGeneric) {
        result := ComCall(11, this, "ptr", pmkRight, "int", fOnlyIfNotGeneric, "ptr*", &ppmkComposite := 0, "HRESULT")
        return IMoniker(ppmkComposite)
    }

    /**
     * Retrieves a pointer to an enumerator for the components of a composite moniker.
     * @param {BOOL} fForward If <b>TRUE</b>, enumerates the monikers from left to right. If <b>FALSE</b>, enumerates from right to left.
     * @returns {IEnumMoniker} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienummoniker">IEnumMoniker</a> pointer variable that receives the interface pointer to the enumerator object for the moniker. When successful, the implementation must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the enumerator object. It is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. If an error occurs or if the moniker has no enumerable components, the implementation sets *<i>ppenumMoniker</i> to <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-imoniker-enum
     */
    Enum(fForward) {
        result := ComCall(12, this, "int", fForward, "ptr*", &ppenumMoniker := 0, "HRESULT")
        return IEnumMoniker(ppenumMoniker)
    }

    /**
     * Determines whether this moniker is identical to the specified moniker.
     * @param {IMoniker} pmkOtherMoniker A  pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface on the moniker to be used for comparison with this one (the one from which this method is called).
     * @returns {HRESULT} This method returns S_OK to indicate that the two monikers are identical, and S_FALSE otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-imoniker-isequal
     */
    IsEqual(pmkOtherMoniker) {
        result := ComCall(13, this, "ptr", pmkOtherMoniker, "int")
        return result
    }

    /**
     * Creates a hash value using the internal state of the moniker.
     * @returns {Integer} A pointer to a variable that receives the hash value.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-imoniker-hash
     */
    Hash() {
        result := ComCall(14, this, "uint*", &pdwHash := 0, "HRESULT")
        return pdwHash
    }

    /**
     * Determines whether the object identified by this moniker is currently loaded and running.
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
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-imoniker-isrunning
     */
    IsRunning(pbc, pmkToLeft, pmkNewlyRunning) {
        result := ComCall(15, this, "ptr", pbc, "ptr", pmkToLeft, "ptr", pmkNewlyRunning, "HRESULT")
        return result
    }

    /**
     * Retrieves the time at which the object identified by this moniker was last changed.
     * @param {IBindCtx} pbc A pointer to the bind context to be used in this binding operation. The bind context caches objects bound during the binding process, contains parameters that apply to all operations using the bind context, and provides the means by which the moniker implementation should retrieve information about its environment. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a>.
     * @param {IMoniker} pmkToLeft If the moniker is part of a composite moniker, pointer to the moniker to the left of this moniker. This parameter is primarily used by moniker implementers to enable cooperation between the various components of a composite moniker. Moniker clients should pass <b>NULL</b>.
     * @returns {FILETIME} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that receives the time of last change. A value of {0xFFFFFFFF,0x7FFFFFFF} indicates an error (for example, exceeded time limit, information not available).
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-imoniker-gettimeoflastchange
     */
    GetTimeOfLastChange(pbc, pmkToLeft) {
        pFileTime := FILETIME()
        result := ComCall(16, this, "ptr", pbc, "ptr", pmkToLeft, "ptr", pFileTime, "HRESULT")
        return pFileTime
    }

    /**
     * Creates a moniker that is the inverse of this moniker. When composed to the right of this moniker or one of similar structure, the moniker will compose to nothing.
     * @returns {IMoniker} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> pointer variable that receives the interface pointer to a moniker that is the inverse of this moniker. When successful, the implementation must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the new inverse moniker. It is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. If an error occurs, the implementation should set *<i>ppmk</i> to <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-imoniker-inverse
     */
    Inverse() {
        result := ComCall(17, this, "ptr*", &ppmk := 0, "HRESULT")
        return IMoniker(ppmk)
    }

    /**
     * Creates a new moniker based on the prefix that this moniker has in common with the specified moniker.
     * @param {IMoniker} pmkOther A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface on another moniker to be compared with this one to determine whether there is a common prefix.
     * @returns {IMoniker} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a>* pointer variable that receives the interface pointer to the moniker that is the common prefix of this moniker and pmkOther. When successful, the implementation must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the resulting moniker; it is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. If an error occurs or if there is no common prefix, the implementation should set *<i>ppmkPrefix</i> to <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-imoniker-commonprefixwith
     */
    CommonPrefixWith(pmkOther) {
        result := ComCall(18, this, "ptr", pmkOther, "ptr*", &ppmkPrefix := 0, "HRESULT")
        return IMoniker(ppmkPrefix)
    }

    /**
     * Creates a relative moniker between this moniker and the specified moniker.
     * @param {IMoniker} pmkOther A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface on the moniker to which a relative path should be taken.
     * @returns {IMoniker} A pointer to an  <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> pointer variable that receives the interface pointer to the relative moniker. When successful, the implementation must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the new moniker; it is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. If an error occurs, the implementation sets *<i>ppmkRelPath</i> to <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-imoniker-relativepathto
     */
    RelativePathTo(pmkOther) {
        result := ComCall(19, this, "ptr", pmkOther, "ptr*", &ppmkRelPath := 0, "HRESULT")
        return IMoniker(ppmkRelPath)
    }

    /**
     * Retrieves the display name for the moniker.
     * @param {IBindCtx} pbc A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> interface on the bind context to be used in this operation. The bind context caches objects bound during the binding process, contains parameters that apply to all operations using the bind context, and provides the means by which the moniker implementation should retrieve information about its environment.
     * @param {IMoniker} pmkToLeft If the moniker is part of a composite moniker, pointer to the moniker to the left of this moniker. This parameter is used primarily by moniker implementers to enable cooperation between the various components of a composite moniker. Moniker clients should pass <b>NULL</b>.
     * @returns {PWSTR} The address of a pointer variable that receives a pointer to the display name string for the moniker. The implementation must use <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-alloc">IMalloc::Alloc</a> to allocate the string returned in <i>ppszDisplayName</i>, and the caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-free">IMalloc::Free</a> to free it. Both the caller and the implementation of this method use the COM task allocator returned by <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cogetmalloc">CoGetMalloc</a>. If an error occurs, the implementation must set *<i>ppszDisplayName</i> should be set to <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-imoniker-getdisplayname
     */
    GetDisplayName(pbc, pmkToLeft) {
        result := ComCall(20, this, "ptr", pbc, "ptr", pmkToLeft, "ptr*", &ppszDisplayName := 0, "HRESULT")
        return ppszDisplayName
    }

    /**
     * Converts a display name into a moniker.
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
     * This method can also return the errors associated with the <a href="/windows/desktop/api/objidl/nf-objidl-imoniker-bindtoobject">IMoniker::BindToObject</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-imoniker-parsedisplayname
     */
    ParseDisplayName(pbc, pmkToLeft, pszDisplayName, pchEaten, ppmkOut) {
        pszDisplayName := pszDisplayName is String ? StrPtr(pszDisplayName) : pszDisplayName

        pchEatenMarshal := pchEaten is VarRef ? "uint*" : "ptr"

        result := ComCall(21, this, "ptr", pbc, "ptr", pmkToLeft, "ptr", pszDisplayName, pchEatenMarshal, pchEaten, "ptr*", ppmkOut, "HRESULT")
        return result
    }

    /**
     * Determines whether this moniker is one of the system-provided moniker classes.
     * @returns {Integer} A pointer to a variables that receives one of the values from the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-mksys">MKSYS</a> enumeration and refers to one of the COM moniker classes. This parameter cannot be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-imoniker-issystemmoniker
     */
    IsSystemMoniker() {
        result := ComCall(22, this, "uint*", &pdwMksys := 0, "HRESULT")
        return pdwMksys
    }
}
