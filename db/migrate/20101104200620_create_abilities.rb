class CreateAbilities < ActiveRecord::Migration

  def self.up
    create_table :abilities, :force => true do |t|
      t.string :name, :limit => 20
      t.string :abrev, :limit => 3
      t.text :description
    end
    add_index :abilities, :id
    add_index :abilities, :name
    add_index :abilities, :abrev
    Ability.reset_column_information

    Ability.create :name => 'Strength', :abrev => 'str', :description => <<-STR
<p>Strength measures muscle and physical power. This ability is important for those who engage in hand-to-hand (or “melee”) combat, such as fighters, monks, paladins, and some rangers. Strength also sets the maximum amount of weight your character can carry. A character with a Strength score of 0 is too weak to move in any way and is unconscious. Some creatures do not possess a Strength score and have no modifier at all to Strength-based skills or checks.  </p>
<p>You apply your character's Strength modifier to:</p>
<ul>
  <li>Melee attack rolls.</li>
  <li>Damage rolls when using a melee weapon or a thrown weapon, including a sling. (Exceptions: Off-hand attacks receive only half the character's Strength bonus, while two-handed attacks receive 1–1/2 times the Strength bonus. A Strength penalty, but not a bonus, applies to attacks made with a bow that is not a composite bow.)</li>
  <li>Climb and Swim checks.</li>
  <li>Strength checks (for breaking down doors and the like).</li>
</ul>
    STR

    Ability.create :name => 'Dexterity', :abrev => 'dex', :description => <<-DEX
<p>Dexterity measures agility, reflexes, and balance. This ability is the most important one for rogues, but it's also useful for characters who wear light or medium armor or no armor at all. This ability is vital for characters seeking to excel with ranged weapons, such as the bow or sling. A character with a Dexterity score of 0 is incapable of moving and is effectively immobile (but not unconscious).</p>
<p>You apply your character's Dexterity modifier to:</p>
<ul>
  <li>Ranged attack rolls, including those for attacks made with bows, crossbows, throwing axes, and many ranged spell attacks like scorching ray or searing light.</li>
  <li>Armor Class (AC), provided that the character can react to the attack.</li>
  <li>Reflex saving throws, for avoiding fireballs and other attacks that you can escape by moving quickly.</li>
  <li>Acrobatics, Disable Device, Escape Artist, Fly, Ride, Sleight of Hand, and Stealth checks.</li>
</ul>
    DEX

    Ability.create :name => 'Constitution', :abrev => 'con', :description => <<-CON
<p>Constitution represents your character's health and stamina. A Constitution bonus increases a character's hit points, so the ability is important for all classes. Some creatures, such as undead and constructs, do not have a Constitution score. Their modifier is +0 for any Constitution-based checks. A character with a Constitution score of 0 is dead.</p>
<p>You apply your character's Constitution modifier to:</p>
<ul>
<li>Each roll of a Hit Die (though a penalty can never drop a result below 1—that is, a character always gains at least 1 hit point each time he advances in level).</li> 
<li>Fortitude saving throws, for resisting poison, disease, and similar threats.</li>
</ul>
<p>If a character's Constitution score changes enough to alter his or her Constitution modifier, the character's hit points also increase or decrease accordingly.</p>
    CON

    Ability.create :name => 'Intelligence', :abrev => 'int', :description => <<-INT
<p>Intelligence determines how well your character learns and reasons. This ability is important for wizards because it affects their spellcasting ability in many ways. Creatures of animal-level instinct have Intelligence scores of 1 or 2. Any creature capable of understanding speech has a score of at least 3. A character with an Intelligence score of 0 is comatose. Some creatures do not possess an Intelligence score. Their modifier is +0 for any Intelligence-based skills or checks.</p>
<p>You apply your character's Intelligence modifier to:</p>
<ul>
  <li>The number of bonus languages your character knows at the start of the game. These are in addition to any starting racial languages and Common. If you have a penalty, you can still read and speak your racial languages unless your Intelligence is lower than 3.</li>
  <li>The number of skill points gained each level, though your character always gets at least 1 skill point per level.</li>
  <li>Appraise, Craft, Knowledge, Linguistics, and Spellcraft checks.</li>
</ul>
<p>A wizard gains bonus spells based on his Intelligence score. The minimum Intelligence score needed to cast a wizard spell is 10 + the spell's level.</p>
    INT

    Ability.create :name => 'Wisdom', :abrev => 'wis', :description => <<-WIS
<p>Wisdom describes a character's willpower, common sense, awareness, and intuition. Wisdom is the most important ability for clerics and druids, and it is also important for paladins and rangers. If you want your character to have acute senses, put a high score in Wisdom. Every creature has a Wisdom score. A character with a Wisdom score of 0 is incapable of rational thought and is unconscious.</p>
<p>You apply your character's Wisdom modifier to:</p>
<ul>
  <li>Will saving throws (for negating the effects of charm person and other spells).</li>
  <li>Heal, Perception, Profession, Sense Motive, and Survival checks.</li>
</ul>
<p>Clerics, druids, and rangers get bonus spells based on their Wisdom scores. The minimum Wisdom score needed to cast a cleric, druid, or ranger spell is 10 + the spell's level.</p>
    WIS

    Ability.create :name => 'Charisma', :abrev => 'cha', :description => <<-CHA
<p>Charisma measures a character's personality, personal magnetism, ability to lead, and appearance. It is the most important ability for paladins, sorcerers, and bards. It is also important for clerics, since it affects their ability to channel energy. For undead creatures, Charisma is a measure of their unnatural “lifeforce.” Every creature has a Charisma score. A character with a Charisma score of 0 is not able to exert himself in any way and is unconscious.</p>
<p>You apply your character's Charisma modifier to:</p>
<ul>
  <li>Bluff, Diplomacy, Disguise, Handle Animal, Intimidate, Perform, and Use Magic Device checks.</li>
  <li>Checks that represent attempts to influence others.</li>
  <li>Channel energy DCs for clerics and paladins attempting to harm undead foes.</li>
</ul>
<p>Bards, paladins, and sorcerers gain a number of bonus spells based on their Charisma scores. The minimum Charisma score needed to cast a bard, paladin, or sorcerer spell is 10 + the spell's level.</p>
    CHA
  end
  def self.down
    drop_table :abilities
  end

end

