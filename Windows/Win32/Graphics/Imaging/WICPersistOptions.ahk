#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies Windows Imaging Component (WIC) options that are used when initializing a component with a stream.
 * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/ne-wincodecsdk-wicpersistoptions
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICPersistOptions extends Win32Enum {

    /**
     * The default persist options. The default is <b>WICPersistOptionLittleEndian</b>.
     * Native name: WICPersistOptionDefault
     * @type {Integer (Int32)}
     */
    static OptionDefault => 0

    /**
     * The data byte order is little endian.
     * Native name: WICPersistOptionLittleEndian
     * @type {Integer (Int32)}
     */
    static OptionLittleEndian => 0

    /**
     * The data byte order is big endian.
     * Native name: WICPersistOptionBigEndian
     * @type {Integer (Int32)}
     */
    static OptionBigEndian => 1

    /**
     * The data format must strictly conform to the specification.
     * 
     * <div class="alert"><b>Warning</b>  This option is inconsistently implement and should not be relied on.</div>
     * <div> </div>
     * Native name: WICPersistOptionStrictFormat
     * @type {Integer (Int32)}
     */
    static OptionStrictFormat => 2

    /**
     * No cache for the metadata stream.
     * 
     * Certain operations, such as <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nf-wincodecsdk-iwiccomponentfactory-createmetadatawriterfromreader">IWICComponentFactory::CreateMetadataWriterFromReader</a> require that the reader have a stream. Therefore, these operations will be unavailable if the reader is initialized with <b>WICPersistOptionNoCacheStream</b>.
     * Native name: WICPersistOptionNoCacheStream
     * @type {Integer (Int32)}
     */
    static OptionNoCacheStream => 4

    /**
     * Use UTF8 instead of the default UTF16.
     * 
     * <div class="alert"><b>Note</b>  This option is currently unused by WIC.</div>
     * <div> </div>
     * Native name: WICPersistOptionPreferUTF8
     * @type {Integer (Int32)}
     */
    static OptionPreferUTF8 => 8

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/ne-wincodecsdk-wicpersistoptions">WICPersistOptions</a> mask.
     * Native name: WICPersistOptionMask
     * @type {Integer (Int32)}
     */
    static OptionMask => 65535
}
