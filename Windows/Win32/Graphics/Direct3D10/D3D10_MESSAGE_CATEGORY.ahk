#Requires AutoHotkey v2.0.0 64-bit

/**
 * Categories of debug messages.
 * @remarks
 * 
 * This is part of the Information Queue feature. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/nn-d3d10sdklayers-id3d10infoqueue">ID3D10InfoQueue Interface</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10sdklayers/ne-d3d10sdklayers-d3d10_message_category
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_MESSAGE_CATEGORY{

    /**
     * User defined message. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10sdklayers/nf-d3d10sdklayers-id3d10infoqueue-addmessage">ID3D10InfoQueue::AddMessage</a>.
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_CATEGORY_APPLICATION_DEFINED => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_CATEGORY_MISCELLANEOUS => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_CATEGORY_INITIALIZATION => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_CATEGORY_CLEANUP => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_CATEGORY_COMPILATION => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_CATEGORY_STATE_CREATION => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_CATEGORY_STATE_SETTING => 6

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_CATEGORY_STATE_GETTING => 7

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_CATEGORY_RESOURCE_MANIPULATION => 8

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_CATEGORY_EXECUTION => 9

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_CATEGORY_SHADER => 10
}
