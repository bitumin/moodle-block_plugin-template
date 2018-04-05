<?php
// This file is part of Moodle - http://moodle.org/
//
// Moodle is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Moodle is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Moodle.  If not, see <http://www.gnu.org/licenses/>.

/**
 * Setting page for newblock block
 *
 * @package    local_newblock
 * @copyright  2016 Your Name <your@email.address>
 * @license    http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 */

defined('MOODLE_INTERNAL') || die;

// Sample code of how to add admin settings:
//if ($ADMIN->fulltree) {
//    $label = new lang_string('customsetting_label', 'block_newblock');
//    $description = new lang_string('customsetting_description', 'block_newblock');
//    $default = 0;
//    $settings->add(new admin_setting_configcheckbox('block_newblock/custom_setting', $label, $description, $default));
//
//    $label = new lang_string('customsetting_label', 'block_newblock');
//    $description = new lang_string('customsetting_description', 'block_newblock');
//    $default = new lang_string('customsetting_default', 'block_newblock');
//    $settings->add(new admin_setting_configtext('block_newblock/custom_setting', $label, $description, $default, PARAM_TEXT));
//}
