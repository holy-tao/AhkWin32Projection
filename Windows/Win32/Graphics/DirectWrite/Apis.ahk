#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DirectWrite {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static DWRITE_ALPHA_MAX => 255

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_DWRITE => 2200

    /**
     * @type {Integer (UInt32)}
     */
    static DWRITE_ERR_BASE => 20480

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_E_REMOTEFONT => -2003283955

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_E_DOWNLOADCANCELLED => -2003283954

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_E_DOWNLOADFAILED => -2003283953

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_E_TOOMANYDOWNLOADS => -2003283952

    /**
     * @type {Integer (UInt32)}
     */
    static DWRITE_STANDARD_FONT_AXIS_COUNT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DWRITE_NO_PALETTE_INDEX => 65535
;@endregion Constants

;@region Methods
    /**
     * Creates a DirectWrite factory object that is used for subsequent creation of individual DirectWrite objects.
     * @remarks
     * This function creates a <a href="https://docs.microsoft.com/windows/win32/DirectWrite/direct-write-portal">DirectWrite</a> factory object that is used for subsequent creation of individual DirectWrite objects.
     *  DirectWrite factory contains internal state data such as font loader registration and cached font data.
     *  In most cases it is recommended you use the shared factory object, because it allows multiple components that use DirectWrite to share internal DirectWrite state data, and thereby reduce memory usage.
     *  However, there are cases when it is desirable to reduce the impact of a component,
     *  such as a plug-in from an untrusted source, on the rest of the process, by sandboxing and isolating it from the rest of the process components. In such cases, it is recommended you use an isolated factory for the sandboxed component.
     * 
     * The following example shows how to create a shared <a href="https://docs.microsoft.com/windows/win32/DirectWrite/direct-write-portal">DirectWrite</a> factory.
     * 
     * 
     * ```cpp
     * 
     * if (SUCCEEDED(hr))
     * {
     *     hr = DWriteCreateFactory(
     *         DWRITE_FACTORY_TYPE_SHARED,
     *         __uuidof(IDWriteFactory),
     *         reinterpret_cast<IUnknown**>(&pDWriteFactory_)
     *         );
     * }
     * 
     * 
     * ```
     * @param {Integer} factoryType Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_factory_type">DWRITE_FACTORY_TYPE</a></b>
     * 
     * A value that specifies whether the factory object will be shared or isolated.
     * @param {Pointer<Guid>} iid Type: <b>REFIID</b>
     * 
     * A GUID value that identifies the DirectWrite factory interface, such as __uuidof(<a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefactory">IDWriteFactory</a>).
     * @returns {Pointer<Pointer<Void>>} Type: <b>IUnknown**</b>
     * 
     * An address of a pointer to the newly created DirectWrite factory object.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-dwritecreatefactory
     * @since windows6.1
     */
    static DWriteCreateFactory(factoryType, iid) {
        result := DllCall("DWrite.dll\DWriteCreateFactory", "int", factoryType, "ptr", iid, "ptr*", &factory := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return factory
    }

;@endregion Methods
}
