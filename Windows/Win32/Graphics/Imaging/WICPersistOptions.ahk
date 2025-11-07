#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies Windows Imaging Component (WIC) options that are used when initializing a component with a stream.
 * @see https://docs.microsoft.com/windows/win32/api//wincodecsdk/ne-wincodecsdk-wicpersistoptions
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICPersistOptions{

    /**
     * The default persist options. The default is <b>WICPersistOptionLittleEndian</b>.
     * @type {Integer (Int32)}
     */
    static WICPersistOptionDefault => 0

    /**
     * The data byte order is little endian.
     * @type {Integer (Int32)}
     */
    static WICPersistOptionLittleEndian => 0

    /**
     * The data byte order is big endian.
     * @type {Integer (Int32)}
     */
    static WICPersistOptionBigEndian => 1

    /**
     * The data format must strictly conform to the specification.
     * 
     * <div class="alert"><b>Warning</b>  This option is inconsistently implement and should not be relied on.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static WICPersistOptionStrictFormat => 2

    /**
     * No cache for the metadata stream.
     * 
     * Certain operations, such as <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nf-wincodecsdk-iwiccomponentfactory-createmetadatawriterfromreader">IWICComponentFactory::CreateMetadataWriterFromReader</a> require that the reader have a stream. Therefore, these operations will be unavailable if the reader is initialized with <b>WICPersistOptionNoCacheStream</b>.
     * @type {Integer (Int32)}
     */
    static WICPersistOptionNoCacheStream => 4

    /**
     * Use UTF8 instead of the default UTF16.
     * 
     * <div class="alert"><b>Note</b>  This option is currently unused by WIC.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static WICPersistOptionPreferUTF8 => 8

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/ne-wincodecsdk-wicpersistoptions">WICPersistOptions</a> mask.
     * @type {Integer (Int32)}
     */
    static WICPersistOptionMask => 65535
}
