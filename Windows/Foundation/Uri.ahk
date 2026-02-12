#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUriRuntimeClass.ahk
#Include .\IUriRuntimeClassWithAbsoluteCanonicalUri.ahk
#Include .\IStringable.ahk
#Include .\IUriRuntimeClassFactory.ahk
#Include .\IUriEscapeStatics.ahk
#Include ..\..\Guid.ahk

/**
 * Defines an object that represents a Uniform Resource Identifier (URI) value and parses it into components. The Uri object is used by many other Windows Runtime APIs that are not necessarily confined to web browser scenarios.
  * 
  * > **.NET**
  * > When programming with .NET, this type is hidden and developers should use [System.Uri](/dotnet/api/system.uri?view=dotnet-uwp-10.0&preserve-view=true). See Remarks.
 * @remarks
 * > [!IMPORTANT]
 * > When programming with .NET, this class is hidden and developers should use the [System.Uri](/dotnet/api/system.uri?view=dotnet-uwp-10.0&preserve-view=true) class, which uses RFC 3987 rules to encode and decode Uniform Resource Identifier (URI). The Windows.Foundation.Uri class doesn't percent-encode non-ASCII characters in Uniform Resource Identifier (URI) where the scheme refers to a Windows file path (like ms-appx:). Windows.Foundation.Uri also interprets percent-encoding using the user's current codepage.
 * 
 * The available members of [System.Uri](/dotnet/api/system.uri?view=dotnet-uwp-10.0&preserve-view=true) are similar but different than the members of Windows.Foundation.Uri, and some of the basic behaviors described in this topic are different. For more info on the encoding differences and what members are available, see [System.Uri](/dotnet/api/system.uri?view=dotnet-uwp-10.0&preserve-view=true) (particularly the Remarks).
 * 
 * Here is a breakdown of the parts of an example Uniform Resource Identifier (URI):
 * 
 * *scheme*:///username*:*password*@*host*:*port/path*.*extension*?*query*#*fragment*
 * 
 * For example:
 * 
 * `http://msdn.microsoft.com/library/windows/apps/windows.foundation.uri.aspx?cs-save-lang=1&amp;cs-lang=cpp#code-snippet-1`
 * 
 * In this example:
 * 
 * + *scheme* is `http`
 * + *host* is `msdn.microsoft.com`
 * + *domain* is `microsoft.com` (a subset of *host*)
 * + *extension* is `aspx`
 * + *query* is `cs-save-lang=1&amp;cs-lang=cpp`
 * + *fragment* is `code-snippet-1`
 * > [!NOTE]
 * >  *username*:*password*@ preceding the *host* are mainly relevant for File Transfer Protocol (FTP)  Uniform Resource Identifier (URI). File Transfer Protocol (FTP) URIs have limited support in Windows Runtime; see "Transferring data in the background" ([HTML](/previous-versions/windows/apps/hh452979(v=win.10)) or [XAML](/previous-versions/windows/apps/hh452975(v=win.10))).
 * 
 * > [!IMPORTANT]
 * > Not all possible schemes are usable by a Windows Runtime app. Notably, the file: scheme is blocked. It's possible to create a Uri object that uses schemes that a Windows Runtime app won't support, and you're blocked when you try to apply that Uri as an input value for an API call, not when creating the object.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.uri
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class Uri extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUriRuntimeClass

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUriRuntimeClass.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new [Uri](uri.md) object from the specified Uniform Resource Identifier (URI) string. Initializing the [Uri](uri.md) also parses the string and populates the [Uri](uri.md) properties that represent Uniform Resource Identifier (URI) components.
     * @param {HSTRING} uri_ The string from which the new [Uri](uri.md) object is created.
     * @returns {Uri} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.uri.#ctor
     */
    static CreateUri(uri_) {
        if (!Uri.HasProp("__IUriRuntimeClassFactory")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.Uri")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUriRuntimeClassFactory.IID)
            Uri.__IUriRuntimeClassFactory := IUriRuntimeClassFactory(factoryPtr)
        }

        return Uri.__IUriRuntimeClassFactory.CreateUri(uri_)
    }

    /**
     * Initializes a new [Uri](uri.md) by combining a base Uniform Resource Identifier (URI) and a relative Uniform Resource Identifier (URI). Initializing the [Uri](uri.md) also parses the combined string and populates the [Uri](uri.md) properties that represent Uniform Resource Identifier (URI) components.
     * @param {HSTRING} baseUri The base Uniform Resource Identifier (URI).
     * @param {HSTRING} relativeUri The relative Uniform Resource Identifier (URI).
     * @returns {Uri} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.uri.#ctor
     */
    static CreateWithRelativeUri(baseUri, relativeUri) {
        if (!Uri.HasProp("__IUriRuntimeClassFactory")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.Uri")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUriRuntimeClassFactory.IID)
            Uri.__IUriRuntimeClassFactory := IUriRuntimeClassFactory(factoryPtr)
        }

        return Uri.__IUriRuntimeClassFactory.CreateWithRelativeUri(baseUri, relativeUri)
    }

    /**
     * Converts the specified string by replacing any escape sequences with their unescaped representation.
     * @remarks
     * Use UnescapeComponent as a utility if you want a user-readable string of just a component, for example just the [Path](uri_path.md) value, unescaped.
     * @param {HSTRING} toUnescape The string to convert.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.uri.unescapecomponent
     */
    static UnescapeComponent(toUnescape) {
        if (!Uri.HasProp("__IUriEscapeStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.Uri")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUriEscapeStatics.IID)
            Uri.__IUriEscapeStatics := IUriEscapeStatics(factoryPtr)
        }

        return Uri.__IUriEscapeStatics.UnescapeComponent(toUnescape)
    }

    /**
     * Converts a Uniform Resource Identifier (URI) string to its escaped representation.
     * @remarks
     * Use EscapeComponent as a utility to escape any Uniform Resource Identifier (URI) component that requires escaping in order to construct a valid [Uri](uri.md) object. For example, if your app is using a user-provided string and adding it to a query that is sent to a service, you may need to escape that string in the Uniform Resource Identifier (URI) because the string might contain characters that are invalid in a Uniform Resource Identifier (URI). This includes characters as simple as spaces; even input that seems to be pure ASCII may still need encoding to be valid as a component of a Uniform Resource Identifier (URI).
     * 
     * You can append the string you get from EscapeComponent onto other strings before calling the [Uri(String) constructor](uri_uri_290278668.md). You'll want to encode each component separately, because you do not want to escape the characters that are significant to how the [Uri(String) constructor](uri_uri_290278668.md) parses the string into components, such as the "/" between host and path or the "?" between path and query.
     * 
     * EscapeComponent might also be useful for other scenarios where a Uniform Resource Identifier (URI)-escaped string is needed for an HTTP request scenario, such as using APIs in the [Windows.Web.Http](../windows.web.http/windows_web_http.md) namespace.
     * @param {HSTRING} toEscape The string to convert.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.uri.escapecomponent
     */
    static EscapeComponent(toEscape) {
        if (!Uri.HasProp("__IUriEscapeStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.Uri")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUriEscapeStatics.IID)
            Uri.__IUriEscapeStatics := IUriEscapeStatics(factoryPtr)
        }

        return Uri.__IUriEscapeStatics.EscapeComponent(toEscape)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the entire, non-canonical URI (It is non-canonical because it might actually be an IRI, per the [Windows.Foundation.Uri](uri.md) encoding behavior; see Remarks.).
     * @remarks
     * This property is not always strictly a URI, per either RFC 3986 or RFC 3987. If you want a strict Uniform Resource Identifier (URI), use the [AbsoluteCanonicalUri](uri_absolutecanonicaluri.md) value instead.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.uri.absoluteuri
     * @type {HSTRING} 
     */
    AbsoluteUri {
        get => this.get_AbsoluteUri()
    }

    /**
     * Gets a representation of the Uniform Resource Identifier (URI) that can be used for display purposes.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.uri.displayuri
     * @type {HSTRING} 
     */
    DisplayUri {
        get => this.get_DisplayUri()
    }

    /**
     * Gets the domain name component, including top-level domain, from a Uniform Resource Identifier (URI).
     * @remarks
     * If the domain name is subject to *Punycode* encoding as shown in [AbsoluteCanonicalUri](uri_absolutecanonicaluri.md), the Domain property shows the decoded value, not the *Punycode* encoded value.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.uri.domain
     * @type {HSTRING} 
     */
    Domain {
        get => this.get_Domain()
    }

    /**
     * Gets the file name extension of the resource that is referenced in the [Uri](uri.md).
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.uri.extension
     * @type {HSTRING} 
     */
    Extension {
        get => this.get_Extension()
    }

    /**
     * Gets the text following a fragment marker (#), including the fragment marker itself.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.uri.fragment
     * @type {HSTRING} 
     */
    Fragment {
        get => this.get_Fragment()
    }

    /**
     * Gets the fully qualified domain name.
     * @remarks
     * If the domain name is subject to *Punycode* encoding as shown in [AbsoluteCanonicalUri](uri_absolutecanonicaluri.md), the Host property shows the decoded value, not the *Punycode* encoded value.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.uri.host
     * @type {HSTRING} 
     */
    Host {
        get => this.get_Host()
    }

    /**
     * Gets the password component of the Uniform Resource Identifier (URI) as stored in this [Uri](uri.md) instance.
     * @remarks
     * > [!NOTE]
     * > *username*:*password***@** preceding the *host* part of a URI are mainly relevant for File Transfer Protocol (FTP) URIs. File Transfer Protocol (FTP) URIs have limited support in Windows Runtime; see "Transferring data in the background" ([HTML](/previous-versions/windows/apps/hh452979(v=win.10)) or [XAML](/previous-versions/windows/apps/hh452975(v=win.10))).
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.uri.password
     * @type {HSTRING} 
     */
    Password {
        get => this.get_Password()
    }

    /**
     * Gets the path and resource name component of the Uniform Resource Identifier (URI) as stored in this [Uri](uri.md) instance.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.uri.path
     * @type {HSTRING} 
     */
    Path {
        get => this.get_Path()
    }

    /**
     * Gets the query string component of the Uniform Resource Identifier (URI) as stored in this [Uri](uri.md) instance.
     * @remarks
     * Query reports the query portion of the Uniform Resource Identifier (URI), and the subdelimiters (&amp; characters) and key-value separators (=) are all reported as-is in that string. [QueryParsed](uri_queryparsed.md) parses this string and creates a map of key-value pairs. This map is returned as a [WwwFormUrlDecoder](wwwformurldecoder.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.uri.query
     * @type {HSTRING} 
     */
    Query {
        get => this.get_Query()
    }

    /**
     * Gets a parsed Uniform Resource Identifier (URI) query string.
     * @remarks
     * [Query](uri_query.md) reports the query portion of the Uniform Resource Identifier (URI), and the subdelimiters (&amp; characters) and key-value separators (=) are all reported as-is in that string. QueryParsed parses this string and creates a read-only list (vector) of name-value pairs. This is returned as a [WwwFormUrlDecoder](wwwformurldecoder.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.uri.queryparsed
     * @type {WwwFormUrlDecoder} 
     */
    QueryParsed {
        get => this.get_QueryParsed()
    }

    /**
     * Gets the entire original Uniform Resource Identifier (URI) string as used to construct this [Uri](uri.md) object, before parsing, and without any encoding applied.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.uri.rawuri
     * @type {HSTRING} 
     */
    RawUri {
        get => this.get_RawUri()
    }

    /**
     * Gets the protocol scheme name component of the Uniform Resource Identifier (URI) as stored in this [Uri](uri.md) instance
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.uri.schemename
     * @type {HSTRING} 
     */
    SchemeName {
        get => this.get_SchemeName()
    }

    /**
     * Gets the user name component of the Uniform Resource Identifier (URI) as stored in this [Uri](uri.md) instance.
     * @remarks
     * > [!NOTE]
     * >  *username*:*password***@** preceding the *host* part of a URI are mainly relevant for File Transfer Protocol (FTP)  Uniform Resource Identifier (URI). File Transfer Protocol (FTP)  Uniform Resource Identifier (URI) have limited support in Windows Runtime; see "Transferring data in the background" ([HTML](/previous-versions/windows/apps/hh452979(v=win.10)) or [XAML](/previous-versions/windows/apps/hh452975(v=win.10))).
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.uri.username
     * @type {HSTRING} 
     */
    UserName {
        get => this.get_UserName()
    }

    /**
     * Gets the port number component of the Uniform Resource Identifier (URI) as stored in this [Uri](uri.md) instance
     * @remarks
     * This property reports the implicit defaults for schemes, such as 80 for http:.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.uri.port
     * @type {Integer} 
     */
    Port {
        get => this.get_Port()
    }

    /**
     * Gets a value that indicates whether parsing determined that the Uniform Resource Identifier (URI) is not well-formed.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.uri.suspicious
     * @type {Boolean} 
     */
    Suspicious {
        get => this.get_Suspicious()
    }

    /**
     * Gets a fully canonical RFC-compliant representation of the current URI.
     * @remarks
     * The canonical URI has all non-US ASCII characters represented as percent-encoded UTF-8 and as *Punycode* in the hostname.
     * 
     * Use the [DisplayIri](uri_displayiri.md) property instead if you want to decode this string so that it can be presented.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.uri.absolutecanonicaluri
     * @type {HSTRING} 
     */
    AbsoluteCanonicalUri {
        get => this.get_AbsoluteCanonicalUri()
    }

    /**
     * Gets the decoded unicode characters that make up the current URI.
     * @remarks
     * The DisplayIri property is an attempted decode of the string as seen in the [AbsoluteCanonicalUri](uri_absolutecanonicaluri.md) property. You might use this string for display to the user, where showing the encodings would be distracting and would make link text that parallels the Uniform Resource Identifier (URI) difficult to read as text. Unsafe values (values that can't be decoded under the user's codepage) are kept as percent-encoded UTF-8.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.uri.displayiri
     * @type {HSTRING} 
     */
    DisplayIri {
        get => this.get_DisplayIri()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AbsoluteUri() {
        if (!this.HasProp("__IUriRuntimeClass")) {
            if ((queryResult := this.QueryInterface(IUriRuntimeClass.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUriRuntimeClass := IUriRuntimeClass(outPtr)
        }

        return this.__IUriRuntimeClass.get_AbsoluteUri()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayUri() {
        if (!this.HasProp("__IUriRuntimeClass")) {
            if ((queryResult := this.QueryInterface(IUriRuntimeClass.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUriRuntimeClass := IUriRuntimeClass(outPtr)
        }

        return this.__IUriRuntimeClass.get_DisplayUri()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Domain() {
        if (!this.HasProp("__IUriRuntimeClass")) {
            if ((queryResult := this.QueryInterface(IUriRuntimeClass.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUriRuntimeClass := IUriRuntimeClass(outPtr)
        }

        return this.__IUriRuntimeClass.get_Domain()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Extension() {
        if (!this.HasProp("__IUriRuntimeClass")) {
            if ((queryResult := this.QueryInterface(IUriRuntimeClass.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUriRuntimeClass := IUriRuntimeClass(outPtr)
        }

        return this.__IUriRuntimeClass.get_Extension()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Fragment() {
        if (!this.HasProp("__IUriRuntimeClass")) {
            if ((queryResult := this.QueryInterface(IUriRuntimeClass.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUriRuntimeClass := IUriRuntimeClass(outPtr)
        }

        return this.__IUriRuntimeClass.get_Fragment()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Host() {
        if (!this.HasProp("__IUriRuntimeClass")) {
            if ((queryResult := this.QueryInterface(IUriRuntimeClass.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUriRuntimeClass := IUriRuntimeClass(outPtr)
        }

        return this.__IUriRuntimeClass.get_Host()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Password() {
        if (!this.HasProp("__IUriRuntimeClass")) {
            if ((queryResult := this.QueryInterface(IUriRuntimeClass.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUriRuntimeClass := IUriRuntimeClass(outPtr)
        }

        return this.__IUriRuntimeClass.get_Password()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Path() {
        if (!this.HasProp("__IUriRuntimeClass")) {
            if ((queryResult := this.QueryInterface(IUriRuntimeClass.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUriRuntimeClass := IUriRuntimeClass(outPtr)
        }

        return this.__IUriRuntimeClass.get_Path()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Query() {
        if (!this.HasProp("__IUriRuntimeClass")) {
            if ((queryResult := this.QueryInterface(IUriRuntimeClass.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUriRuntimeClass := IUriRuntimeClass(outPtr)
        }

        return this.__IUriRuntimeClass.get_Query()
    }

    /**
     * 
     * @returns {WwwFormUrlDecoder} 
     */
    get_QueryParsed() {
        if (!this.HasProp("__IUriRuntimeClass")) {
            if ((queryResult := this.QueryInterface(IUriRuntimeClass.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUriRuntimeClass := IUriRuntimeClass(outPtr)
        }

        return this.__IUriRuntimeClass.get_QueryParsed()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RawUri() {
        if (!this.HasProp("__IUriRuntimeClass")) {
            if ((queryResult := this.QueryInterface(IUriRuntimeClass.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUriRuntimeClass := IUriRuntimeClass(outPtr)
        }

        return this.__IUriRuntimeClass.get_RawUri()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SchemeName() {
        if (!this.HasProp("__IUriRuntimeClass")) {
            if ((queryResult := this.QueryInterface(IUriRuntimeClass.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUriRuntimeClass := IUriRuntimeClass(outPtr)
        }

        return this.__IUriRuntimeClass.get_SchemeName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UserName() {
        if (!this.HasProp("__IUriRuntimeClass")) {
            if ((queryResult := this.QueryInterface(IUriRuntimeClass.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUriRuntimeClass := IUriRuntimeClass(outPtr)
        }

        return this.__IUriRuntimeClass.get_UserName()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Port() {
        if (!this.HasProp("__IUriRuntimeClass")) {
            if ((queryResult := this.QueryInterface(IUriRuntimeClass.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUriRuntimeClass := IUriRuntimeClass(outPtr)
        }

        return this.__IUriRuntimeClass.get_Port()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Suspicious() {
        if (!this.HasProp("__IUriRuntimeClass")) {
            if ((queryResult := this.QueryInterface(IUriRuntimeClass.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUriRuntimeClass := IUriRuntimeClass(outPtr)
        }

        return this.__IUriRuntimeClass.get_Suspicious()
    }

    /**
     * Determines whether the specified [Uri](uri.md) object is equal to the current [Uri](uri.md) object.
     * @remarks
     * Equality comparison is based on the logical content (the property values).
     * 
     * 
     * <!--Calls COM IUri::IsEqual, which is documented as 'logical content'. The usage as == does not seem to have this behavior though?-->
     * @param {Uri} pUri The [Uri](uri.md) object to be compared.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.uri.equals
     */
    Equals(pUri) {
        if (!this.HasProp("__IUriRuntimeClass")) {
            if ((queryResult := this.QueryInterface(IUriRuntimeClass.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUriRuntimeClass := IUriRuntimeClass(outPtr)
        }

        return this.__IUriRuntimeClass.Equals(pUri)
    }

    /**
     * Adds the specified Uniform Resource Identifier (URI) to the current [Uri](uri.md).
     * @param {HSTRING} relativeUri A relative Uniform Resource Identifier (URI) specified as a string. This relative path is evaluated using the host/authority of the [Uri](uri.md) instance where this method is called.
     * @returns {Uri} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.uri.combineuri
     */
    CombineUri(relativeUri) {
        if (!this.HasProp("__IUriRuntimeClass")) {
            if ((queryResult := this.QueryInterface(IUriRuntimeClass.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUriRuntimeClass := IUriRuntimeClass(outPtr)
        }

        return this.__IUriRuntimeClass.CombineUri(relativeUri)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AbsoluteCanonicalUri() {
        if (!this.HasProp("__IUriRuntimeClassWithAbsoluteCanonicalUri")) {
            if ((queryResult := this.QueryInterface(IUriRuntimeClassWithAbsoluteCanonicalUri.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUriRuntimeClassWithAbsoluteCanonicalUri := IUriRuntimeClassWithAbsoluteCanonicalUri(outPtr)
        }

        return this.__IUriRuntimeClassWithAbsoluteCanonicalUri.get_AbsoluteCanonicalUri()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayIri() {
        if (!this.HasProp("__IUriRuntimeClassWithAbsoluteCanonicalUri")) {
            if ((queryResult := this.QueryInterface(IUriRuntimeClassWithAbsoluteCanonicalUri.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUriRuntimeClassWithAbsoluteCanonicalUri := IUriRuntimeClassWithAbsoluteCanonicalUri(outPtr)
        }

        return this.__IUriRuntimeClassWithAbsoluteCanonicalUri.get_DisplayIri()
    }

    /**
     * Gets a canonical string representation for the current [Uri](uri.md).
     * @remarks
     * This **ToString** implementation is for the [IStringable](istringable.md) interface as implemented by the [Uri](uri.md) class. [IStringable](istringable.md) is supported starting with Windows 8.1 and is also available in Windows Phone 8.1. The [IStringable](istringable.md) definition of **ToString** implementation is not literally an override of **Platform::Object** and its base API, but it does replace the **ToString** behavior.
     * 
     *   For Windows 8 and Windows Phone 8, [Uri](uri.md) does not implement [IStringable](istringable.md) (it's not available). So the **ToString** method of [Uri](uri.md) remains the one that's implemented by **Platform::Object** or JavaScript "object" support for Windows Runtime. The apparent difference in origin of the **ToString** API is only visible for Visual C++ component extensions (C++/CX) and JavaScript, and you should consider it as an implementation detail that doesn't matter as far as how you use **ToString** in either case.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.uri.tostring
     */
    ToString() {
        if (!this.HasProp("__IStringable")) {
            if ((queryResult := this.QueryInterface(IStringable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStringable := IStringable(outPtr)
        }

        return this.__IStringable.ToString()
    }

;@endregion Instance Methods
}
