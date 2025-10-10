#Requires AutoHotkey v2.0.0 64-bit

/**
 * The type flags.
 * @remarks
 * 
  * TYPEFLAG_FAPPOBJECT can be used on type descriptions with TypeKind = TKIND_COCLASS, and indicates that the type description specifies an Application object.
  * 
  * Members of the Application object are globally accessible. The <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/nf-oaidl-itypecomp-bind">Bind</a> method of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-itypecomp">ITypeComp</a> instance associated with the library binds to the members of an Application object, just as it does for type descriptions that have TypeKind = TKIND_MODULE.
  * 
  * 
  * 
  * The type description implicitly defines a global variable with the same name and type described by the type description. This variable is also globally accessible. When <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/nf-oaidl-itypecomp-bind">Bind</a> is passed the name of an Application object, a VARDESC is returned, which describes the implicit variable. The ID of the implicitly created variable is always ID_DEFAULTINST.
  * 
  * 
  * 
  * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nf-oaidl-itypeinfo-createinstance">ITypeInfo::CreateInstance</a> function of an Application object type description is called, and then it uses <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-getactiveobject">GetActiveObject</a> to retrieve the Application object. If <b>GetActiveObject</b> fails because the application is not running, then <b>CreateInstance</b> calls <b>CoCreateInstance</b>, which should start the application.
  * 
  * 
  * 
  * When TYPEFLAG_FCANCREATE is set, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nf-oaidl-itypeinfo-createinstance">CreateInstance</a> can create an instance of this type. This is true only for component object classes for which a globally unique identifier (GUID) has been specified.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//oaidl/ne-oaidl-typeflags
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class TYPEFLAGS{

    /**
     * A type description that describes an Application object.
     * @type {Integer (Int32)}
     */
    static TYPEFLAG_FAPPOBJECT => 1

    /**
     * Instances of the type can be created by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nf-oaidl-itypeinfo-createinstance">ITypeInfo::CreateInstance</a>.
     * @type {Integer (Int32)}
     */
    static TYPEFLAG_FCANCREATE => 2

    /**
     * The type is licensed.
     * @type {Integer (Int32)}
     */
    static TYPEFLAG_FLICENSED => 4

    /**
     * The type is predefined. The client application should automatically create a single instance of the object that has this attribute. The name of the variable that points to the object is the same as the class name of the object.
     * @type {Integer (Int32)}
     */
    static TYPEFLAG_FPREDECLID => 8

    /**
     * The type should not be displayed to browsers.
     * @type {Integer (Int32)}
     */
    static TYPEFLAG_FHIDDEN => 16

    /**
     * The type is a control from which other types will be derived, and should not be displayed to users.
     * @type {Integer (Int32)}
     */
    static TYPEFLAG_FCONTROL => 32

    /**
     * The interface supplies both <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> and VTBL binding.
     * @type {Integer (Int32)}
     */
    static TYPEFLAG_FDUAL => 64

    /**
     * The interface cannot add members at run time.
     * @type {Integer (Int32)}
     */
    static TYPEFLAG_FNONEXTENSIBLE => 128

    /**
     * The types used in the interface are fully compatible with Automation, including VTBL binding support. Setting dual on an interface sets this flag in addition to TYPEFLAG_FDUAL. Not allowed on dispinterfaces.
     * @type {Integer (Int32)}
     */
    static TYPEFLAG_FOLEAUTOMATION => 256

    /**
     * Should not be accessible from macro languages. This flag is intended for system-level types or types that type browsers should not display.
     * @type {Integer (Int32)}
     */
    static TYPEFLAG_FRESTRICTED => 512

    /**
     * The class supports aggregation.
     * @type {Integer (Int32)}
     */
    static TYPEFLAG_FAGGREGATABLE => 1024

    /**
     * The type is replaceable.
     * @type {Integer (Int32)}
     */
    static TYPEFLAG_FREPLACEABLE => 2048

    /**
     * Indicates that the interface derives from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a>, either directly or indirectly. This flag is computed. There is no Object Description Language for the flag.
     * @type {Integer (Int32)}
     */
    static TYPEFLAG_FDISPATCHABLE => 4096

    /**
     * The type has reverse binding.
     * @type {Integer (Int32)}
     */
    static TYPEFLAG_FREVERSEBIND => 8192

    /**
     * Interfaces can be marked with this flag to indicate that they will be using a proxy/stub dynamic link library. This flag specifies that the typelib proxy should not be unregistered when the typelib is unregistered.
     * @type {Integer (Int32)}
     */
    static TYPEFLAG_FPROXY => 16384
}
