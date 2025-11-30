#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of DirectWrite factory object.
 * @remarks
 * 
 * A DirectWrite factory object contains information about its internal state, such as font loader registration and cached font data. In most cases you should use the shared factory object, because it allows multiple components that use DirectWrite to share internal DirectWrite state information, thereby reducing memory usage. However, there are cases when it is desirable to reduce the impact of a component on the rest of the process, such as a plug-in from an untrusted source,  by sandboxing and isolating it from the rest of the process components. In such cases, you should use an isolated factory for the sandboxed component.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/ne-dwrite-dwrite_factory_type
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_FACTORY_TYPE extends Win32Enum{

    /**
     * Indicates that the DirectWrite factory is a shared factory and that it allows for the reuse of cached font data across multiple in-process components. Such factories also take advantage of cross process font caching components for better performance.
     * @type {Integer (Int32)}
     */
    static DWRITE_FACTORY_TYPE_SHARED => 0

    /**
     * Indicates that the DirectWrite factory object is isolated. Objects created from the isolated factory do not interact with internal DirectWrite state from other components.
     * @type {Integer (Int32)}
     */
    static DWRITE_FACTORY_TYPE_ISOLATED => 1
}
