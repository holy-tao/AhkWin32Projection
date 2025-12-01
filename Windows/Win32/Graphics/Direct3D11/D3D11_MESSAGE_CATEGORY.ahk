#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Categories of debug messages. (D3D11_MESSAGE_CATEGORY)
 * @remarks
 * This is part of the Information Queue feature. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/nn-d3d11sdklayers-id3d11infoqueue">ID3D11InfoQueue Interface</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_message_category
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_MESSAGE_CATEGORY extends Win32Enum{

    /**
     * User defined message. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11infoqueue-addmessage">ID3D11InfoQueue::AddMessage</a>.
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_CATEGORY_APPLICATION_DEFINED => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_CATEGORY_MISCELLANEOUS => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_CATEGORY_INITIALIZATION => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_CATEGORY_CLEANUP => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_CATEGORY_COMPILATION => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_CATEGORY_STATE_CREATION => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_CATEGORY_STATE_SETTING => 6

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_CATEGORY_STATE_GETTING => 7

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_CATEGORY_RESOURCE_MANIPULATION => 8

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_CATEGORY_EXECUTION => 9

    /**
     * <b>Direct3D 11:  </b>This value is not supported until Direct3D 11.1.
     * @type {Integer (Int32)}
     */
    static D3D11_MESSAGE_CATEGORY_SHADER => 10
}
